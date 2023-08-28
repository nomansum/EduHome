const advertisementSchema = require("../models/Advertisement");
const teacherSchema = require("../models/Teacher");
const fetchTutors = async (req, res) => {
  try {
    const {
      gender,
      experience,
      location,
      teachingSubject,
      minSalary,
      maxSalary,
    } = req.body;

    const query = {};
    let subjectsArray;

    let locationPattern;
    let experienceValue;
    let minSalaryValue, maxSalaryValue;

    if (gender) query.gender = gender;
    if (experience) {
      experienceValue = parseInt(experience, 10);

      if (experienceValue == 5) {
        query.$expr = {
          $gte: [{ $toInt: "$experience" }, experienceValue],
        };
      } else {
        query.$expr = {
          $and: [
            { $gte: [{ $toInt: "$experience" }, experienceValue] },
            { $lte: [{ $toInt: "$experience" }, experienceValue] },
          ],
        };
      }
    }

    if (minSalary) {
      minSalaryValue = parseInt(minSalary, 10);
      maxSalaryValue = parseInt(maxSalary, 10);
    } else {
      minSalaryValue = 0;
      maxSalaryValue = 10000000;
    }

    if (minSalary && maxSalary) {
      query.$expr = {
        $and: [
          { $gte: [{ $toInt: "$minSalary" }, minSalaryValue] },
          { $lte: [{ $toInt: "$maxSalary" }, maxSalaryValue] },
        ],
      };
    }

    if (teachingSubject) {
      subjectsArray = teachingSubject.split(",");
      // console.log(subjectsArray);
      query.teachingSubject = { $in: subjectsArray };
    }

    if (location) {
      locationPattern = new RegExp(location, "i");
      query.location = { $regex: locationPattern };
    }

    let data = await teacherSchema.find(query);

    res.status(200).json(data);
  } catch (e) {
    res.status(500).json({ error: e.toString() });
  }
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
