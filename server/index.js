

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

app.get("/",async(req,res)=>{
    let data = await userSchema.deleteMany({})
    res.json(data);
})

app.use('/filter',filterRouter);

app.use("/users",userRoute);





mongoose.connect(DB).then(()=>{
    console.log("Connected To DB");
})






app.listen(PORT,()=>{
    console.log(`connected at port ${PORT}`);
})