const express = require("express");

const userRoute = express.Router();
const userController = require("../controllers/userController");

userRoute.post("/saveUserData", userController.saveUserData);

userRoute.post("/getUserData", userController.getUserData);

userRoute.post("/saveStudentData", userController.saveStudentData);
userRoute.post("/saveTeacherData", userController.saveTeacherData);
userRoute.post("/updateStudentProfile", userController.updateStudentProfile);
userRoute.post("/updateTeacherProfile", userController.updateTeacherProfile);
userRoute.post("/getStudentData", userController.getStudentData);
userRoute.post("/getTeacherData", userController.getTeacherData);

module.exports = userRoute;
