const mongoose = require('mongoose');

const userSchema = mongoose.Schema({
    name:{
        required: true,
        type:String,
        trim: true,
    },
    email: {
        required: true,
        type:String,
        trim: true,
        validate:{
            validator : (value)=>{
                const re = /^[a-zA-Z0-9_.+]*[a-zA-Z][a-zA-Z0-9_.+]*@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
               return value.match(re)
            },
            message:"enter valid email address",
        }
        
    },
    password:{
        type:String,
        required:true,
    },
    address:{
        type:String,
        default:"",
    },
    type:{
      type:String,
      default:"user"
    }

})

const user = mongoose.model('User',userSchema)
module.exports = user;