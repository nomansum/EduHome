const Teacher = require("../models/Teacher");
const Student = require("../models/Student");
const Notification = require("../models/Notification");
const Advertisement = require("../models/Advertisement");
const Offer = require("../models/Offer");

const getAllAdvertisement = async (req, res) => {
  try {
    const advertisements = await Advertisement.find().sort({ _id: -1 });
    // const advertisements = await Advertisement.find();
    res.status(200).json(advertisements);
  } catch (err) {
    res
      .status(404)
      .json({ message: "Failed to retrive all advertisement details" });
  }
};

const getFilteredAdvertisement = async (req, res) => {
  try {
    const { subject, gender, tuitionType, salary } = req.query;

    const filters = {};
    if (subject) filters.subject = subject;
    if (gender) filters.teacherGender = gender;
    if (tuitionType) filters.tuitionType = tuitionType;
    if (salary) filters.salary = { $gte: parseInt(salary) };

    const filteredAdvertisements = await Advertisement.find(filters);

    res.status(200).json(filteredAdvertisements);
  } catch (error) {
    console.error("Error applying filters and fetching advertisements:", error);
    res.status(500).json({ error: "An error occurred" });
  }
};

const getTeacherAllStudents = async (req, res) => {
  const { id } = req.params;

  try {
    const teacher = await Teacher.findById(id);

    if (!teacher) {
      return res.status(404).json({ message: "Teacher not found" });
    }

    const studentIds = teacher.studentId;

    // Query all students with IDs in the studentId array
    const myStudents = await Student.find({ _id: { $in: studentIds } });

    res.status(200).json(myStudents);
  } catch (error) {
    res.status(500).json({ message: "Failed to retrieve teacher's students" });
  }
};

const getIndividualStudent = (req, res) => {
  res.json({ msg: "Teacher's Student details " });
};

const getPendingOffers = async (req, res) => {
  const { id } = req.params;

  try {
    const pendingOffers = await Offer.find({ teacherId: id }).sort({
      _id: -1,
    });
    res.status(200).json(pendingOffers);
  } catch (error) {
    res.status(500).json("Failed to retrieve all the pending offer");
  }
};

const getTeacherSchedule = async (req, res) => {
  const { id } = req.params; ///getting teacher id
  try {
    const schedule = await ClassScheduling.findById(id);
    res.json(schedule);
  } catch (err) {
    res.status(500).json({ message: "Failed to retrieve Teachers schedule" });
  }
};

const getTeacherNotifications = async (req, res) => {
  const teacherId = req.params.id;

  try {
    const notifications = await Notification.find({
      recipientId: teacherId,
    }).sort({ _id: -1 }); // Sort by createdAt in descending order

    res.status(200).json(notifications);
  } catch (error) {
    console.error("Error fetching notifications:", error);
    res
      .status(500)
      .json({ error: "An error occurred while fetching notifications." });
  }
};

const getTeacherProfileDetails = async (req, res) => {
  const teacherId = req.params.id;

  try {
    const profile = await Teacher.findById(teacherId);

    if (!profile) {
      return res.status(404).json({ message: "Teacher profile not found." });
    }
    res.json(profile);
  } catch (err) {
    res
      .status(500)
      .json({ message: "Failed to retrieve Teacher's profile information." });
  }
};

const teacherLogout = (req, res) => {
  res.json({
    msg: "T logout",
  });
};

const applyForTuition = async (req, res) => {
  const advertisementId = req.params.advertisementId;
  const teacherId = req.body.teacherId;

  try {
    const advertisement = await Advertisement.findById(advertisementId);
    if (!advertisement) {
      return res.status(404).json({ error: "Advertisement not found" });
    }

    advertisement.teacherId.push(teacherId);
    await advertisement.save();

    const studentId = advertisement.studentId;
    const teacher = await Teacher.findById(teacherId);
    const newNotification = new Notification({
      senderId: teacherId,
      recipientId: studentId,
      messageType: "teacherAppliedAdvertisement",
      message: `${teacher.fullName} applied for your tuition advertisement.You can review him in applicant section`,
    });

    await newNotification.save();

    res.status(200).json("Applied Successfully");
  } catch (error) {
    console.error("Error applying for tuition:", error);
    res
      .status(500)
      .json({ error: "An error occurred while applying for tuition" });
  }
};

const acceptPendingOffer = async (req, res) => {
  const teacherId = req.params.id;
  const studentId = req.params.studentId;

  try {
    // Find the teacher by ID
    const teacher = await Teacher.findById(teacherId);
    const student = await Student.findById(studentId);

    if (!teacher) {
      return res.status(404).json({ message: "Teacher not found" });
    }
    if (!student) {
      return res.status(404).json({ message: "Student not found" });
    }

    teacher.studentId.push(studentId);

    student.teacherId.push(teacherId);

    await teacher.save();
    await student.save();

    const newNotification = new Notification({
      senderId: teacherId,
      recipientId: studentId,
      messageType: "teacherAcceptedOffer",
      message: `${teacher.fullName} accepted your tuition offer. His phone number is ${teacher.phoneNumber}.You can contact him now`,
    });

    await newNotification.save();

    const newwNotification = new Notification({
      senderId: studentId,
      recipientId: teacherId,
      messageType: "teacherAcceptedOffer",
      message: `You just accepted ${student.fullName}'s tuition offer. His phone number is ${student.phoneNumber}.You can contact him now`,
    });

    await newwNotification.save();

    await Offer.deleteOne({ teacherId, studentId });

    return res.status(200).json({ message: "Offer accepted successfully" });
  } catch (error) {
    console.error("Error accepting offer:", error);
    return res.status(500).json({ message: "Internal server error" });
  }
};

const rejectPendingOffer = async (req, res) => {
  const teacherId = req.params.id;
  const studentId = req.params.studentId;

  try {
    const teacher = await Teacher.findById(teacherId);

    if (!teacher) {
      return res.status(404).json({ message: "Teacher not found" });
    }
    const newNotification = new Notification({
      senderId: teacherId,
      recipientId: studentId,
      messageType: "teacherRejectedOffer",
      message: `${teacher.fullName} rejected your tuition offer.`,
    });

    await newNotification.save();

    await Offer.deleteOne({ teacherId, studentId });

    return res.status(200).json({ message: "Offer Rejected successfully" });
  } catch (error) {
    console.error("Error accepting offer:", error);
    return res.status(500).json({ message: "Internal server error" });
  }
};

const getAllTeachers = async (req, res) => {
  try {
    const teachers = await Teacher.find().sort({ _id: -1 });
    res.status(200).json(teachers);
  } catch (err) {
    res.status(404).json({ message: "Failed to retrive all teacher details" });
  }
};

//UPDATE
const updateTeacher = async (req, res) => {
  const teacherId = req.params.id;
  const updateData = req.body;

  try {
    const updatedTeacher = await Teacher.findByIdAndUpdate(
      teacherId,
      updateData,
      { new: true }
    );

    if (!updatedTeacher) {
      return res.status(404).json({ error: "Teacher not found" });
    }

    res
      .status(200)
      .json({ message: "Teacher profile updated", teacher: updatedTeacher });
  } catch (error) {
    res
      .status(500)
      .json({ error: "An error occurred while updating teacher profile" });
  }
};

module.exports = {
  getAllTeachers,
  getAllAdvertisement,
  getTeacherAllStudents,
  getPendingOffers,
  getIndividualStudent,
  getTeacherSchedule,
  getTeacherNotifications,
  getTeacherProfileDetails,
  teacherLogout,
  acceptPendingOffer,
  updateTeacher,
  getFilteredAdvertisement,
  rejectPendingOffer,
  applyForTuition,
};
