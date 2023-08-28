const express = require("express");
const filterController = require("../controllers/filterController");

const filterRouter = express.Router();

filterRouter.post("/getAdvertisements", filterController.fetchAdvertisements);
filterRouter.post("/getTutors", filterController.fetchTutors);
module.exports = filterRouter;
