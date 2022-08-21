const express = require('express');
var bcrypt = require('bcryptjs');
const authRouter = express.Router();
const User = require("../models/user")

authRouter.post("/api/signup", async (req, res) => {
  try {
    const { name, email, password } = req.body;
    const exisitingUser = await User.findOne({ email });
    if (exisitingUser) {
      res.status(400).json({ message: "this email is already exisit" });
    }
    bcrypt.genSalt(10, (err, salt) => {
      bcrypt.hash("B4c0/\/", salt,async(err, hash) => {
        let user = new User({
          name,
          email,
          password:hash
        });
        const value = await user.save();
        res.json(value);
      });
    });


  } catch (error) {
    res.status(500).send(error);
  }
})

module.exports = authRouter;