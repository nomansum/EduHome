const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const studentSchema = new Schema({
  fullName: {
    type: String,
    required: true,
    min: 2,
    max: 50,
  },

  classStudies: {
    type: Number,
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
});

module.exports = mongoose.model("Student", studentSchema);
