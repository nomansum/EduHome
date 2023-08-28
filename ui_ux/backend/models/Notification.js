const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const notificationSchema = new Schema({
  senderId: {
    type: String,
    required: true,
  },
  recipientId: {
    type: String,
    required: true,
  },
  messageType: {
    type: String,
    enum: [
      "teacherAcceptedOffer",
      "teacherRejectedOffer",
      "studentAcceptedApplication",
      "teacherAppliedAdvertisement",
      "studentSentOffer",
    ],
    required: true,
  },
  message: {
    type: String,
    required: true,
  },
});
module.exports = mongoose.model("Notification", notificationSchema);
