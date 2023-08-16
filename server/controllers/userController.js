
const userSchema = require("../models/Users")
const saveUserData = async(req,res)=>{
 
   try{
       const user = req.body;
   
    const newUser = new userSchema(user);
   
    await newUser.save();
   
     res.json(newUser);
   
   }
   catch(e){
       res.status(500).json({error:e.toString()})
   }
   
   };

   const getUserData = async(req,res)=>{
    
      try{
         
       const {email} = req.body;
   
       const user = await userSchema.find({email});
   
        res.status(200).json(user);
     
   
      }
      catch(e){
       res.status(500).json({error:e.toString()})
      }
   
   
   
   }



   module.exports = {saveUserData , getUserData};