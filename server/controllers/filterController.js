const advertisementSchema = require("../models/Advertisement");
const fetchTutors = (req, res) => {
  // fetch teacher
  res.status(200).json({ msg: "Working Till Here" });
};

const fetchAdvertisements = async (req, res) => {
  try {
    const {
      tuitionType,
      classNo,
      teacherGender,
      daysInWeek,
      minSalary,
      maxSalary,
      subjects,
      location,
    } = req.body;

    let subjectsArray;

    let locationPattern;
    let minSalaryValue, maxSalaryValue;
    const query = {};

    if (tuitionType) query.tuitionType = tuitionType;
    if (classNo) query.class = classNo;
    if (teacherGender) query.teacherGender = teacherGender;
    if (daysInWeek) query.daysInWeek = daysInWeek;
    if (minSalary) minSalaryValue = parseInt(minSalary);
    else {
      minSalaryValue = 0;
    }
    if (maxSalary) maxSalaryValue = parseInt(maxSalary);
    else {
      maxSalaryValue = 50000;
    }

    query.salary = { $gte: minSalaryValue, $lte: maxSalaryValue };

    if (subjects) {
      subjectsArray = subjects.split(",");
      console.log(subjectsArray);
      query.subjects = { $in: subjectsArray };
    }
    if (location) {
      locationPattern = new RegExp(location, "i");
      query.location = { $regex: locationPattern };
    }

    let data = await advertisementSchema.find(query);

    res.status(200).json(data);
  } catch (e) {
    res.status(500).json({ error: "An error occured while fetching" });
  }
};

module.exports = {
  fetchTutors,
  fetchAdvertisements,
};
