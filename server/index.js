

const express = require('express');
const mongoose = require('mongoose')
const advertisementSchema = require("./models/Advertisement");
const userSchema = require('./models/Users')
const filterRouter = require('./routes/filterDataRoute');
const userRoute = require('./routes/userRoute')
const app = express();

 app.use(express.json())


const PORT = 4000;


const DB ="mongodb+srv://muntasirnahid87:8Re8vAReV4YpCDt8@eduhome.ik65e6g.mongodb.net/?retryWrites=true&w=majority";



app.use('/filter',filterRouter);



app.get('/getallposts',async (req,res)=>{
    let data = await advertisementSchema.find({});

    res.json(data);
})

app.use("/users",userRoute);

app.get("/getAllUsers",async (req,res)=>{
    let data = await userSchema.find({});
    res.json(data);

})

app.post("/getUserData",async(req,res)=>{
    
   try{
      
    const {email} = req.body;

    const user = await userSchema.find({email});

     res.status(200).json(user);
  

   }
   catch(e){
    res.status(500).json({error:e.toString()})
   }



})


app.use('/filter',filterRouter);

mongoose.connect(DB).then(()=>{
    console.log("Connected To DB");
})






app.listen(PORT,()=>{
    console.log(`connected at port ${PORT}`);
})