import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_ux/constants/filter_object_student.dart';

class StudentMyDrawer extends StatefulWidget {
  final Function onDataSelected;
  final Function applyFilters;
  final Function clearFilters;

  StudentMyDrawer({
    required this.onDataSelected,
    required this.applyFilters,
    required this.clearFilters,
  });

  @override
  State<StudentMyDrawer> createState() => _StudentMyDrawerState();
}

class _StudentMyDrawerState extends State<StudentMyDrawer> {
  int clickPhysics = 0,
      clickMath = 0,
      clickChemistry = 0,
      clickEnglish = 0,
      clickBiology = 0,
      clickIct = 0,
      clickMale = 0,
      clickFemale = 0,
      click2k = 0,
      click3k = 0,
      click7k = 0,
      click5k = 0,
      click10k = 0,
      click20k = 0,
      click1s = 0,
      click2s = 0,
      click3s = 0,
      click4s = 0,
      click5s = 0;

  String location = "";

  FilterObjectStudent filterObjectStudent = FilterObjectStudent();

  int _onButtonPressed(int clickCount) {
    return clickCount == 0 ? 1 : 0;
  }

  Color getButtonColor(int clickCount) {
    return clickCount % 2 == 0 ? Colors.grey : Color(0xFF00BFA5);
  }

  void clearFilters() {
    setState(() {
      clickPhysics = 0;
      clickMath = 0;
      clickChemistry = 0;
      clickEnglish = 0;
      clickBiology = 0;
      clickIct = 0;
      clickMale = 0;
      clickFemale = 0;
      click2k = 0;
      click3k = 0;
      click7k = 0;
      click5k = 0;
      click10k = 0;
      click20k = 0;
      click1s = 0;
      click2s = 0;
      click3s = 0;
      click4s = 0;
      click5s = 0;

      location = "";
      filterObjectStudent = FilterObjectStudent();
    });

    widget.onDataSelected(filterObjectStudent);
  }

  void applyFilters() {
    print(filterObjectStudent.toString());
    // Apply the filters and pass the filtered list to the onDataSelected callback
    widget.onDataSelected(filterObjectStudent);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          color: Colors.blueGrey[200],
          child: ListView(
            //  padding: EdgeInsets.zero,

            children: [
              IconButton(
                onPressed: () {
                  widget.clearFilters();
                  //  Navigator.pop(context);
                },
                icon: Icon(FontAwesomeIcons.circleXmark),
                color: const Color(0xFFF82525),
                padding: EdgeInsets.fromLTRB(0, 0, 270, 2),
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Subject',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            clickPhysics = _onButtonPressed(clickPhysics);
                            setState(() {
                              if (clickPhysics == 1) {
                                filterObjectStudent.teachingSubject +=
                                    "Physics,";
                              } else {
                                filterObjectStudent.teachingSubject =
                                    filterObjectStudent.teachingSubject
                                        .replaceAll("Physics,", "");
                              }
                            });
                            widget.onDataSelected(filterObjectStudent);
                          },
                          child: Text('Physics'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(clickPhysics),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            clickMath = _onButtonPressed(clickMath);
                            setState(() {
                              // clickPhysics = 1 - clickPhysics; // Toggle between 0 and 1
                              if (clickMath == 1) {
                                filterObjectStudent.teachingSubject += "Math,";
                              } else {
                                filterObjectStudent.teachingSubject =
                                    filterObjectStudent.teachingSubject
                                        .replaceAll("Math,", "");
                              }
                            });
                            widget.onDataSelected(filterObjectStudent);
                          },
                          child: Text('Math'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(clickMath),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            clickChemistry = _onButtonPressed(clickChemistry);
                            setState(() {
                              if (clickChemistry == 1) {
                                filterObjectStudent.teachingSubject +=
                                    "Chemistry,";
                              } else {
                                filterObjectStudent.teachingSubject =
                                    filterObjectStudent.teachingSubject
                                        .replaceAll("Chemistry,", "");
                              }
                            });
                            widget.onDataSelected(filterObjectStudent);
                          },
                          child: Text('Chemistry'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(clickChemistry),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            clickEnglish = _onButtonPressed(clickEnglish);
                            setState(() {
                              if (clickEnglish == 1) {
                                filterObjectStudent.teachingSubject +=
                                    "English,";
                              } else {
                                filterObjectStudent.teachingSubject =
                                    filterObjectStudent.teachingSubject
                                        .replaceAll("English,", "");
                              }
                            });
                            widget.onDataSelected(filterObjectStudent);
                          },
                          child: Text('English'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(clickEnglish),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            clickBiology = _onButtonPressed(clickBiology);
                            setState(() {
                              if (clickBiology == 1) {
                                filterObjectStudent.teachingSubject +=
                                    "Biology,";
                              } else {
                                filterObjectStudent.teachingSubject =
                                    filterObjectStudent.teachingSubject
                                        .replaceAll("Biology,", "");
                              }
                            });
                            widget.onDataSelected(filterObjectStudent);
                          },
                          child: Text('Biology'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(clickBiology),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            clickIct = _onButtonPressed(clickIct);
                            setState(() {
                              if (clickIct == 1) {
                                filterObjectStudent.teachingSubject += "ICT,";
                              } else {
                                filterObjectStudent.teachingSubject =
                                    filterObjectStudent.teachingSubject
                                        .replaceAll("ICT,", "");
                              }
                            });
                            widget.onDataSelected(filterObjectStudent);
                          },
                          child: Text('ICT'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(clickIct),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.green,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Gender',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            clickMale = _onButtonPressed(clickMale);
                            if (clickMale == 1) {
                              filterObjectStudent.gender = "Male";
                            } else {
                              filterObjectStudent.gender = "";
                            }
                            widget.onDataSelected(filterObjectStudent);
                          },
                          child: Text('Male'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(clickMale),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            clickFemale = _onButtonPressed(clickFemale);
                            if (clickFemale == 1) {
                              filterObjectStudent.gender = "Female";
                            } else {
                              filterObjectStudent.gender = "";
                            }
                            widget.onDataSelected(filterObjectStudent);
                          },
                          child: Text('Female'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(clickFemale),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.green,
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            location = value;
                          });

                          filterObjectStudent.location = location;
                          widget.onDataSelected(filterObjectStudent);
                        },
                        decoration: InputDecoration(
                          labelText: 'Location',
                          hintText: 'Enter your preferred location',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xFF00BFA5),
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF00BFA5),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.green,
                      thickness: 1,
                    ),
                    Text(
                      'Max Salary Range ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            click2k = _onButtonPressed(click2k);
                            if (click2k == 1) {
                              filterObjectStudent.minSalary = "2000";
                              filterObjectStudent.maxSalary = "3000";
                            } else {
                              filterObjectStudent.minSalary = "";
                              filterObjectStudent.maxSalary = "";
                            }
                            widget.onDataSelected(filterObjectStudent);
                          },
                          child: Text('2k-3k'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(click2k),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            click3k = _onButtonPressed(click3k);
                            if (click3k == 1) {
                              filterObjectStudent.minSalary = "4000";
                              filterObjectStudent.maxSalary = "6000";
                            } else {
                              filterObjectStudent.minSalary = "";
                              filterObjectStudent.maxSalary = "";
                            }
                            widget.onDataSelected(filterObjectStudent);
                          },
                          child: Text('4k-6k'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(click3k),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            click5k = _onButtonPressed(click5k);
                            if (click5k == 1) {
                              filterObjectStudent.minSalary = "5000";
                              filterObjectStudent.maxSalary = "7000";
                            } else {
                              filterObjectStudent.minSalary = "";
                              filterObjectStudent.maxSalary = "";
                            }
                            widget.onDataSelected(filterObjectStudent);
                          },
                          child: Text('5k-7k'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(click5k),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            click7k = _onButtonPressed(click7k);
                            if (click7k == 1) {
                              filterObjectStudent.minSalary = "7000";
                              filterObjectStudent.maxSalary = "9000";
                            } else {
                              filterObjectStudent.minSalary = "";
                              filterObjectStudent.maxSalary = "";
                            }
                            widget.onDataSelected(filterObjectStudent);
                          },
                          child: Text('7k-9k'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(click7k),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            click10k = _onButtonPressed(click10k);
                            if (click10k == 1) {
                              filterObjectStudent.minSalary = "10000";
                              filterObjectStudent.maxSalary = "20000";
                            } else {
                              filterObjectStudent.minSalary = "";
                              filterObjectStudent.maxSalary = "";
                            }
                            widget.onDataSelected(filterObjectStudent);
                          },
                          child: Text('10k-20k'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(click10k),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            click20k = _onButtonPressed(click20k);
                            if (click20k == 1) {
                              filterObjectStudent.minSalary = "20000";
                              filterObjectStudent.maxSalary = "40000";
                            } else {
                              filterObjectStudent.minSalary = "";
                              filterObjectStudent.maxSalary = "";
                            }
                            widget.onDataSelected(filterObjectStudent);
                          },
                          child: Text('20k+'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getButtonColor(click10k),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.67,
                      child: ElevatedButton(
                        onPressed: () {
                          applyFilters();
                          Navigator.pop(context);
                        },
                        child: Text('Apply'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFF00BFA5),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
