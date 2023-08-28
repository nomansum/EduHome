const mongoose = require("mongoose");
const bcrypt = require("bcrypt");

const Schema = mongoose.Schema;

const studentSchema = new Schema({
  fullName: {
    type: String,
    required: true,
    min: 2,
    max: 50,
  },

  classStudies: {
    type: String, //will be string
    required: true,
  },
  location: {
    type: String,
    required: true,
    max: 50,
  },
  phoneNumber: {
    type: String,
    required: true,
    min: 6,
    max: 12,
  },
  // password: {
  //   type: String,
  //   required: true,
  //   min: 5,
  // },
  picturePath: {
    type: String,
    default: "",
    required: false,
  },
  institution: {
    type: String,
    max: 30,
    required: false,
  },
  teacherId: {
    type: Array,
    //required: true,
    default: [],
  },
  advertisementId: {
    type: Array,
    default: [],
  },
  email: {
    type: String,
    required: true,
    unique: true,
  },
});

module.exports = mongoose.model("Student", studentSchema);
