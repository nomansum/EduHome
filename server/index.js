const express = require("express");
const mongoose = require("mongoose");
const advertisementSchema = require("./models/Advertisement");
const userSchema = require("./models/Users");
const filterRouter = require("./routes/filterDataRoute");
const userRoute = require("./routes/userRoute");
const teacherSchema = require("./models/Teacher");
const studentSchema = require("./models/Student");
const app = express();

app.use(express.json());

const PORT = 4000;

const DB =
  "mongodb+srv://albqkx:1921141425@eduhome.eskt5gx.mongodb.net/?retryWrites=true&w=majority";
// "mongodb+srv://muntasirnahid87:8Re8vAReV4YpCDt8@eduhome.ik65e6g.mongodb.net/?retryWrites=true&w=majority";
//"mongodb+srv://albqkx:1921141425@eduhome.eskt5gx.mongodb.net/?retryWrites=true&w=majority";
app.get("/", async (req, res) => {
  var advertisements = await teacherSchema.find({});
  res.status(200).json(advertisements);
});

app.use("/filter", filterRouter);

app.use("/users", userRoute);

mongoose.connect(DB).then(() => {
  console.log("Connected To DB");
});

app.listen(PORT, () => {
  console.log(`connected at port ${PORT}`);
});
