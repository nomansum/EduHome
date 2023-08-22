const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const userSchema = new Schema({
  email: {
    type: String,
    required: true,
    unique: true,
  },
  usertype: {
    type: String,
    required: true,
  },
});

module.exports = mongoose.model("Users", userSchema);
