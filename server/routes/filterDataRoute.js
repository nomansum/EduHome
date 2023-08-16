
const express = require('express')
const filterController = require('../controllers/filterController');

const filterRouter = express.Router();


filterRouter.get('/getAdvertisements',filterController.fetchAdvertisements);



module.exports = filterRouter;