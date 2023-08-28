const express = require("express");
const router = express.Router();
const Teacher = require("../models/Teacher");
const {
  getAllAdvertisement,
  getTeacherAllStudents,
  getIndividualStudent,
  getPendingOffers,
  getTeacherSchedule,
  getTeacherNotifications,
  getTeacherProfileDetails,
  teacherLogout,
  acceptPendingOffer,
  updateTeacher,
  getAllTeachers,
  getFilteredAdvertisement,
  rejectPendingOffer,
  applyForTuition,
} = require("../controllers/teacher");

//GET
router.get("/advertisement", getAllAdvertisement); // Teacher Home Page , where all advertisement will be seen.

router.get("/applyFilter", getFilteredAdvertisement);

router.get("/:id/myStudents", getTeacherAllStudents); // my studentList

router.get("/:id/myStudents/:studentId", getIndividualStudent); // details of individual student from all my students

router.get("/:id/notifications", getTeacherNotifications);

router.get("/:id/pendingOffer", getPendingOffers); // pending tuition request.

router.get("/:id/mySchedule", getTeacherSchedule); //  get my schedule

router.get("/:id/notifications", getTeacherNotifications); // get my notifications

router.get("/:id/profile", getTeacherProfileDetails); // view profile (get profile details)

router.get("/:id/logout", teacherLogout); //  logout

//POST
router.post("/reg", async (req, res) => {
  const teacher = req.body;

  const teacherDetails = new Teacher(teacher);

  await teacherDetails.save();
  res.json(teacherDetails);
});

router.post("/:id/pendingOfferAc/:studentId", acceptPendingOffer); // accepting tuition offer

router.post("/:id/pendingOfferRe/:studentId", rejectPendingOffer); // Reject tuition offer

router.post("/advertisement/apply/:advertisementId", applyForTuition); //apply for advertisement

//UPDATE
router.patch("/:id/Profile", updateTeacher); // updating profile.

module.exports = router;
