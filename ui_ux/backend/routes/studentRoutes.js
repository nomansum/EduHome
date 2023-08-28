const express = require("express");
const router = express.Router();
const Student = require("../models/Student");

const {
  getStudentHomePage,
  getStudentAllTeachers,
  getStudentSchedule,
  getStudentNotifications,
  getStudentProfile,
  //getIndividualTeacher,
  getApplicantsList,
  getStudentsIndividualTeacherDetails,
  getMyAdvertisements,
  studentLogout,
  postTuitionAdvertisement,
  updateStudent,
  updateTuitionPost,
  deleteTuitionAdvertisement,
  acceptApplicant,
  getAdvertisementById,
  offerTeacher,
  cancelOffer,
  rateTeacher,
} = require("../controllers/student");

const { getAllTeachers } = require("../controllers/teacher");

//GET
router.get("/getAllTeachers", getStudentHomePage);

router.get("/:id/myTeachers", getStudentAllTeachers); // my teacher list

router.get("/:id/mySchedule", getStudentSchedule); // schedule according to available teacher's routine.

router.get("/:id/notifications", getStudentNotifications); // notifications

router.get("/:id/profile", getStudentProfile); // details of profile

//router.get("/:id/moreTeacher/:teacherId", getIndividualTeacher); // get individual teacher from all teacher.

router.get("/:advertisementId/applicants", getApplicantsList); // wil come from advertisement.js

router.get("/:id/myTeacher/:teacherId", getStudentsIndividualTeacherDetails); //  get details of individual teacher who teaches me

router.get("/:id/advertisements", getMyAdvertisements); //get advertisement of that specific student

router.get("/advertisements/:advertisementId", getAdvertisementById);

router.get("/:id/logout", studentLogout); // logout

//POST
router.post("/:id/postAdvertisement", postTuitionAdvertisement); // advertise a tuitioin post.
router.post("/:id/:advertisementId/applicants/:teacherId", acceptApplicant);
router.post("/:id/offer/:teacherId", offerTeacher);
router.post("/rateTeacher/:teacherId", rateTeacher);

//UPDATE
router.patch("/:id/Profile", updateStudent); // update profile
router.patch("/:id/updateTuitionPost", updateTuitionPost); //here id is advertisements id

//DELETE
router.delete(
  "/:id/advertisement/:advertisementId",
  deleteTuitionAdvertisement
);

router.delete("/:id/offercancel/:teacherId", cancelOffer);

module.exports = router;
