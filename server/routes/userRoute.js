
const express = require('express');

const userRoute = express.Router();
const userController = require('../controllers/userController')

userRoute.post("/saveUserData",userController.saveUserData);

userRoute.post("/getUserData",userController.getUserData);


module.exports = userRoute;