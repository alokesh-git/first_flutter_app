// Import all the packages here
const express = require('express');
const mongoose = require('mongoose');
// Importall the file here
const authRouter = require("./router/auth");
const app = express();

app.use(express.json());
app.use(authRouter);
mongoose
.connect("mongodb://localhost:27017/user")
.then(() => { console.log("connected with mongodb"); })
.catch(err => { console.log(err); })

app.listen(3000, () => { console.log("listening at port no 3000") })