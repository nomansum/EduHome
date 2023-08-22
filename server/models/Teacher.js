const mongoose = require("mongoose");

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
    unique: true,
  },
  phoneNumber: {
    type: String,
    required: true,
    min: 6,
    max: 12,
  },

  occupation: {
    type: String,
    required: true,
  },

  institution: {
    type: String,
    required: true,

    max: 50,
  },
  subject: {
    type: String,
    required: false,
  },
  picturePath: {
    type: String,
    default: "",
  },
  teachingSubject: {
    type: Array,

    default: [],
  },
  rating: {
    type: Array,
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
    default: [],
  },
});

module.exports = mongoose.model("Teacher", teacherSchema);
