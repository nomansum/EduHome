
const express = require('express');

const userRoute = express.Router();
const userController = require('../controllers/userController')

userRoute.post("/saveUserData",userController.saveUserData);

userRoute.get("/getUserData",userController.getUserData);


module.exports = userRoute;