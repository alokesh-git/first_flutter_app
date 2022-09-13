const express = require('express');
var bcrypt = require('bcryptjs');
const authRouter = express.Router();
const jwt = require('jsonwebtoken');
const User = require("../models/user");
const { Router } = require('express');
const auth = require('../middleware/auth');

// signUp ---------🔥🔥🔥🔥🔥🔥🔥🔥

authRouter.post("/api/SignUp", async (req, res) => {
  try {
    const { name, email, password } = req.body;
    const exisitingUser = await User.findOne({ email });
    if (exisitingUser) {
      res.status(400).json({ msg: "this email is already exisit" });
    }
    var hash = await bcrypt.hash(password, 10);
    let user = new User({
      name,
      email,
      password: hash
    });
    const value = await user.save();
    res.json(value);


  } catch (e) {
    res.status(500).json({ error: e.message });
  }
})

// 🔥🔥🔥🔥  sign In part is here  🔥🔥🔥🔥🔥🔥

authRouter.post("/api/SignIn", async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ email });
    if (!user) {
      res.status(400).json({ msg: "this email is not exisit" });
    }
    var isMach = await bcrypt.compare(password, user.password);
    if (!isMach) {
      res.status(400).json({ msg: "this password is Incorrect" });
    }
    const token = jwt.sign({ id: user._id }, "passwordToken");
    res.json({ token, ...user._doc })

  } catch (e) {
    res.status(500).json({ error: e.message });
  }

})

authRouter.post("/tokenIsValid",async (req,res)=>{
try {
  const token = req.header('user-auth-token');
  if(!token) return res.json(false);
  const verify = jwt.verify(token,'passwordToken');
  if(!verify) return res.json(false);
 
  const user = User.findById(verify.id);
  if(!user) return res.json(false);
  res.json(true);
} catch (e) {
  res.status(500).json({ error: e.message });
}
})

authRouter.get("/",auth,async(req,res)=>{
 try {
  const user = await User.findById(req.user);
  res.json({...user._doc, token: req.token});
 
 } catch (e) {
  res.status(500).json({ error: e.message });
 } 
})

module.exports = authRouter;