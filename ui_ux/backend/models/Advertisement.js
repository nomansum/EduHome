const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const advertisementSchema = new Schema({
  tuitionType: {
    type: String,
    required: true,
  },
  class: {
    type: String,
    required: true,
  },
  teacherGender: {
    type: String,
    required: true,
    default: "Male",
  },
  daysInWeek: {
    type: Number,
    required: true,
  },
  salary: {
    type: Number,
    required: true,
  },

  subjects: {
    type: String,
    required: true,
    max: 50,
  },
  location: {
    type: String,
    max: 50,
    required: true,
  },
  studentId: {
    type: String,
    required: true,
  },
  teacherId: {
    type: Array,
    default: [],
    //   required: true,
  },
  booked: {
    type: Boolean,
    required: false,
  },
  applied: {
    type: Boolean,
    default: false,
  },
});

module.exports = mongoose.model("Advertisement", advertisementSchema);
