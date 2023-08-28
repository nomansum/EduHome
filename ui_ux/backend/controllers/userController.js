const userSchema = require("../models/Users");
const studentSchema = require("../models/Student");
const teacherSchema = require("../models/Teacher");
const saveUserData = async (req, res) => {
  try {
    const user = req.body;

    const newUser = new userSchema(user);

    await newUser.save();

    res.status(200).json(newUser);
  } catch (e) {
    res.status(500).json({ error: e.toString() });
  }
};

const getUserData = async (req, res) => {
  try {
    const { email } = req.body;

    const user = await userSchema.find({ email });

    res.status(200).json(user);
  } catch (e) {
    res.status(500).json({ error: e.toString() });
  }
};

const saveStudentData = async (req, res) => {
  try {
    const { id, ...data } = req.body;

    const student = new studentSchema(data);
    const response = await student.save();
    res.status(200).json(response);
  } catch (e) {
    res.status(500).json({ error: e.toString() });
  }
};

const saveTeacherData = async (req, res) => {
  try {
    //const prevData = req.body;

    const { id, ...prevData } = req.body;

    const subjects = req.body.teachingSubject;
    const subjectArray = subjects.split(",");

    const data = { ...prevData, teachingSubject: subjectArray };

    const teacher = new teacherSchema(data);
    const response = await teacher.save();
    res.status(200).json(response);
  } catch (e) {
    res.status(500).json({ error: e.toString() });
  }
};

const updateTeacherProfile = async (req, res) => {
  try {
    const { id, teachingSubject, ...data } = req.body;
    const subjectArray = teachingSubject.split(",");
    const updatedData = { ...data, teachingSubject: subjectArray };

    await teacherSchema.findByIdAndUpdate(id, updatedData);

    const response = await teacherSchema.findById(id);

    res.status(200).json(response);
  } catch (e) {
    res.status(500).json({ error: e.toString() });
  }
};

const updateStudentProfile = async (req, res) => {
  try {
    const { id, ...data } = req.body;

    await studentSchema.findByIdAndUpdate(id, data);

    const response = await studentSchema.findById(id);

    res.status(200).json(response);
  } catch (e) {
    res.status(500).json({ error: e.toString() });
  }
};
const getTeacherData = async (req, res) => {
  try {
    const { email } = req.body;
    const user = await teacherSchema.find({ email });

    res.status(200).json(user);
    // res.status(200).json(response);
  } catch (e) {
    res.status(500).json({ error: e.toString() });
  }
};
const getStudentData = async (req, res) => {
  try {
    const { email } = req.body;
    const user = await studentSchema.find({ email });

    res.status(200).json(user);
  } catch (e) {
    res.status(500).json({ error: e.toString() });
  }
};

module.exports = {
  saveUserData,
  getUserData,
  saveStudentData,
  saveTeacherData,
  updateTeacherProfile,
  updateStudentProfile,
  getTeacherData,
  getStudentData,
};
