const express = require('express');
const app = express();

app.get("/",(req,res)=>{
    res.send("this is my fist flutter project")
})

app.listen(3000,()=>{console.log("listening at port no 3000")})