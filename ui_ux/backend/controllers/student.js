const Student = require("../models/Student");
const Notification = require("../models/Notification");
const { mongoose } = require("mongoose");
const Teacher = require("../models/Teacher");
const Advertisement = require("../models/Advertisement");
const Offer = require("../models/Offer");

const getStudentHomePage = async (req, res) => {
  try {
    const teachers = await Teacher.find().sort({ _id: -1 });
    res.status(200).json(teachers);
  } catch (err) {
    res.status(404).json({ message: "Failed to retrive all teachers details" });
  }
};

const getStudentAllTeachers = async (req, res) => {
  const { id } = req.params;

  try {
    const student = await Student.findById(id);

    if (!student) {
      return res.status(404).json({ message: "Student not found" });
    }

    const teacherIds = student.teacherId;

    const myTeachers = await Teacher.find({ _id: { $in: teacherIds } });

    res.status(200).json(myTeachers);
  } catch (error) {
    res.status(500).json({ message: "Failed to retrieve student's teachers" });
  }
};

const getStudentNotifications = async (req, res) => {
  const studentId = req.params.id;

  try {
    const notifications = await Notification.find({
      recipientId: studentId,
    }).sort({ _id: -1 }); // Sort by createdAt in descending order

    res.status(200).json(notifications);
  } catch (error) {
    console.error("Error fetching notifications:", error);
    res
      .status(500)
      .json({ error: "An error occurred while fetching notifications." });
  }
};

const getStudentSchedule = async (req, res) => {
  const { id } = req.params;

  try {
    const schedule = await ClassScheduling.findById(id);

    res.json(schedule);
  } catch (err) {
    res
      .status(500)
      .json({ message: "Failed to retrieve students notification" });
  }
};

const getStudentProfile = async (req, res) => {
  const { id } = req.params;

  try {
    const profile = await Student.findById(id);

    if (!profile) {
      return res.status(404).json({ message: "Student profile not found." });
    }
    res.json(profile);
  } catch (err) {
    res
      .status(500)
      .json({ message: "Failed to retrieve student's profile information." });
  }
};

const getApplicantsList = async (req, res) => {
  const advertisementId = req.params.advertisementId;

  try {
    const advertisement = await Advertisement.findById(advertisementId);

    const applicantsId = advertisement.teacherId;

    const applicants = await Teacher.find({ _id: { $in: applicantsId } });

    res.status(200).json(applicants);
  } catch (error) {
    res.status(500).json({ msg: "Failed in getting applicants list" });
  }
};
const getAdvertisementById = async (req, res) => {
  const advertisementId = req.params.advertisementId;

  try {
    const advertisement = await Advertisement.findById(advertisementId);

    if (!advertisement) {
      return res.status(404).json({ message: "Advertisement not found" });
    }

    return res.status(200).json({
      message: "Advertisement fetched successfully",
      advertisement: advertisement,
    });
  } catch (error) {
    console.error("Error fetching advertisement:", error);
    return res.status(500).json({ message: "Internal server error" });
  }
};

const getStudentsIndividualTeacherDetails = async (req, res) => {
  const { id, teacherId } = req.params;

  try {
    const teacher = await Teacher.findById(teacherId);
    const teacherDetails = teacher._doc;
    res.status(200).json(teacherDetails);
  } catch (error) {
    res.status(500).json({ msg: "Teacher Data can not be fetched from db" });
  }
};

const getMyAdvertisements = async (req, res) => {
  const { id } = req.params;

  try {
    const student = await Student.findById(id);

    if (!student) {
      return res.status(404).json({ message: "Student not found" });
    }

    const advertisementIds = student.advertisementId;

    const myAdvertisements = await Advertisement.find({
      _id: { $in: advertisementIds },
    })
      .sort({ _id: -1 })
      .exec();

    res.status(200).json(myAdvertisements);
  } catch (error) {
    res
      .status(500)
      .json({ message: "Failed to retrieve students advertisements" });
  }
};

const studentLogout = (req, res) => {
  res.json({ msg: "Student Logged OUT" });
};

const postTuitionAdvertisement = async (req, res) => {
  const { id } = req.params; //studentId from the URL
  const advertisementData = req.body;

  try {
    const newAdvertisement = new Advertisement(advertisementData);
    newAdvertisement.studentId = id;
    await newAdvertisement.save();

    const student = await Student.findById(id);
    console.log(newAdvertisement);
    await student.advertisementId.push(newAdvertisement._id);
    await student.save();

    res.status(200).json(newAdvertisement);
  } catch (error) {
    console.error("Error inserting advertisement:", error);
    res.status(500).json({ msg: "Error inserting advertisement" });
  }
};

const updateStudent = async (req, res) => {
  const studentId = req.params.id;
  const updateData = req.body; // updated data from request body

  try {
    const updatedStudent = await Student.findByIdAndUpdate(
      studentId,
      updateData,
      { new: true }
    );

    if (!updatedStudent) {
      return res.status(404).json({ error: "Student not found" });
    }

    res
      .status(200)
      .json({ message: "Student profile updated", student: updatedStudent });
  } catch (error) {
    res
      .status(500)
      .json({ error: "An error occurred while updating student profile" });
  }
};

const updateTuitionPost = async (req, res) => {
  const advertisementId = req.params.id;
  const updateData = req.body;

  try {
    const updatedAdvertisement = await Advertisement.findByIdAndUpdate(
      advertisementId,
      updateData,
      { new: true }
    );

    if (!updatedAdvertisement) {
      return res.status(404).json({ error: "Advertisement not found" });
    }
    console.log("update donee");
    res.status(200).json({
      message: "Advertisement updated",
      advertisement: updatedAdvertisement,
    });
  } catch (error) {
    res
      .status(500)
      .json({ error: `Error updating advertisement: ${error.message}` });
  }
};

const acceptApplicant = async (req, res) => {
  const studentId = req.params.id;
  const advertisementId = req.params.advertisementId;
  const teacherId = req.params.teacherId;

  try {
    const teacher = await Teacher.findById(teacherId);
    const student = await Student.findById(studentId);
    const advertisement = await Advertisement.findById(advertisementId);

    if (!teacher) {
      return res.status(404).json({ message: "Teacher not found" });
    }
    if (!student) {
      return res.status(404).json({ message: "Student not found" });
    }
    if (!advertisement) {
      return res.status(404).json({ message: "Advertisement not found" });
    }

    teacher.studentId.push(studentId);

    student.teacherId.push(teacherId);

    await teacher.save();
    await student.save();

    advertisement.booked = true;

    await advertisement.save();

    const updatedAdvertisement = await Advertisement.findById(advertisementId);

    const newNotification = new Notification({
      senderId: studentId,
      recipientId: teacherId,
      messageType: "studentAcceptedApplication",
      message: `${student.fullName} accepted your tuition application. His phone number is ${student.phoneNumber}.You can contact him now`,
    });

    await newNotification.save();

    const newwNotification = new Notification({
      senderId: teacherId,
      recipientId: studentId,
      messageType: "studentAcceptedApplication",
      message: `You just accepted ${teacher.fullName}'s tuition application. His phone number is ${teacher.phoneNumber}.You can contact him now`,
    });

    await newwNotification.save();

    return res.status(200).json({
      message: "Applicant selected successfully",
      updatedAdvertisement: updatedAdvertisement,
    });
  } catch (error) {
    console.error("Error selecting applicant:", error);
    return res.status(500).json({ message: "Internal server error" });
  }
};

const offerTeacher = async (req, res) => {
  const id = req.params.id;
  const teacherId = req.params.teacherId;
  const { note } = req.body;

  try {
    // Check if the offer already exists
    const existingOffer = await Offer.findOne({ studentId: id, teacherId });

    if (existingOffer) {
      // Update the existing offer with the new note
      existingOffer.note = note;
      await existingOffer.save();
      res.json({ message: "Offer updated successfully" });
    } else {
      const student = await Student.findById(id);
      const classStudies = student.classStudies;
      const location = student.location;
      const studentName = student.fullName;
      const picturePath = student.picturePath;
      // Create a new offer
      const newOffer = new Offer({
        studentName,
        studentId: id,
        teacherId,
        classStudies,
        picturePath,
        location,
        note,
      });
      await newOffer.save();

      const newNotification = new Notification({
        senderId: id,
        recipientId: teacherId,
        messageType: "studentSentOffer",
        message: `${student.fullName} sent you a tuition offer.Review it now!`,
      });

      // Save the new notification
      await newNotification.save();

      res.json({ message: "Offer created successfully" });
    }
  } catch (error) {
    console.error("Error creating/updating offer:", error);
    res.status(500).json({ error: "An error occurred" });
  }
};

const cancelOffer = async (req, res) => {
  const { id, teacherId } = req.params;

  try {
    const deletedOffer = await Offer.findOneAndDelete({
      studentId: id,
      teacherId: teacherId,
    });

    if (deletedOffer) {
      res.status(200).json("Offer canceled successfully.");
    } else {
      res.status(404).json("Offer not found.");
    }
  } catch (error) {
    res.status(500).json("Failed to cancel the offer.");
  }
};

const rateTeacher = async (req, res) => {
  const { teacherId } = req.params;
  const { rating } = req.body;

  try {
    const updatedTeacher = await Teacher.findByIdAndUpdate(
      teacherId,
      { $push: { rating: rating } },
      { new: true } // To get the updated teacher document
    );

    if (updatedTeacher) {
      res.status(200).json("Rating added successfully.");
    } else {
      res.status(404).json("Teacher not found.");
    }
  } catch (error) {
    res.status(500).json("Failed to add rating.");
  }
};

const deleteTuitionAdvertisement = async (req, res) => {
  try {
    const studentId = req.params.id;
    const advertisementId = req.params.advertisementId;

    await Advertisement.findByIdAndDelete(advertisementId);

    await Student.findByIdAndUpdate(studentId, {
      $pull: { advertisementId: advertisementId },
    });

    res.status(204).json({ message: "Advertisement deleted successfully" });
  } catch (error) {
    console.error("Error deleting advertisement:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

module.exports = {
  getStudentHomePage,
  getStudentAllTeachers,
  getStudentSchedule,
  getStudentNotifications,
  getStudentProfile,
  getApplicantsList,
  getStudentsIndividualTeacherDetails,
  studentLogout,
  postTuitionAdvertisement,
  updateStudent,
  getMyAdvertisements,
  updateTuitionPost,
  deleteTuitionAdvertisement,
  acceptApplicant,
  getAdvertisementById,
  offerTeacher,
  cancelOffer,
  rateTeacher,
};
