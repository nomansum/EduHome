const mongoose = require("mongoose");
const bcrypt = require("bcrypt");

const Schema = mongoose.Schema;

const teacherSchema = new Schema({
  fullName: {
    type: String,
    required: true,
    min: 2,
    max: 50,
  },
  gender: {
    type: String,
    required: true,
    default: "Male",
  },
  experience: {
    type: String,
    required: true,
  },
  location: {
    type: String,
    required: true,
    max: 50,
  },
  email: {
    type: String,
    required: true,
    max: 20,
    unique: true,
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
  occupation: {
    type: String,
    required: true,
  },

  institution: {
    type: String,
    required: true,
    // min:2,
    max: 50,
  },
  subject: {
    type: String,
    required: false,
  },
  picturePath: {
    type: String,
    default: "",
    required: false,
  },
  teachingSubject: {
    type: Array,
    required: false,
    default: [],
  },
  rating: {
    type: [Number], 
    default: [],
  },
  minSalary: {
    type: String,
    required: true,
  },
  maxSalary: {
    type: String,
    required: true,
  },
  studentId: {
    type: Array,
    //  required: true,
    default: [],
  },
});

module.exports = mongoose.model("Teacher", teacherSchema);
