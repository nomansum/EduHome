import 'package:flutter/material.dart';
import '../../constants/dropdown_list.dart';
import '../../constants/input_decoration.dart';
import '../../widgets/custom_dropdown_for_post_tuition.dart';

class EditTuitionPost extends StatefulWidget {
  const EditTuitionPost({super.key});

  @override
  State<EditTuitionPost> createState() => _EditTuitionPostState();
}

class _EditTuitionPostState extends State<EditTuitionPost> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> tuitionType = ["Offline", "Online"];
  final tuitionTypeController = TextEditingController();
  
  
  final List<String> classOfTuition = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    'Other',
    'Alim',
    'Dawra'
  ];

  final List<String> Salaries = salaryList;

  final List<String> preferredGender = ["Male", "Female"];
  final List<String> daysInWeek = ["1", "2", "3", "4", "5", "6", "7"];
  String selectedGender = "";
  String selectedDays = "";

  String selectedTuitionType = "";
  String selectedClass = "";
  String selectedSalary = "";

  final locationEditingController = TextEditingController();

  final subjectEditingController = TextEditingController();

  void handleSalary(String value) {
    setState(() {
      selectedSalary = value;
    });
  }

  void handleTuitionType(String value) {
    setState(() {
      selectedTuitionType = value;
    });
  }

  void handleClass(String value) {
    setState(() {
      selectedClass = value;
    });
  }

  void handlePreferredGender(String value) {
    setState(() {
      selectedGender = value;
    });
  }

  void handleDaysInWeek(String value) {
    setState(() {
      selectedDays = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SafeArea(
                child: TextButton(
                  child: Text(
                    '< Applicant List',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 2.0, // Adjust the height of the line as needed
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black,
                        Colors.transparent,
                      ],
                      stops: [
                        0.1,
                        0.7,
                        0.9
                      ], // Adjust the stops to control the boldness at the center
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 16), // Add spacing between gradients and text
                child: Text(
                  "Edit Post",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Container(
                  height: 2.0, // Adjust the height of the line as needed
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black,
                        Colors.transparent,
                      ],
                      stops: [
                        0.1,
                        0.7,
                        0.9
                      ], // Adjust the stops to control the boldness at the center
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 100,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        width: 145,
                        //height: 80,
                        child: Text(
                          "Tuition Type",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      CustomDropDownButtonForPostTuition(
                        //value:widget.userDetails.occupation,
                        items: tuitionType.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                        // iconData: Icons.business_center_sharp,
                        onChangeFunctionality: handleTuitionType,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        width: 145,
                        child: Text(
                          "Class",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      CustomDropDownButtonForPostTuition(
                        //value:widget.userDetails.occupation,
                        items: classOfTuition.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                        // iconData: Icons.business_center_sharp,
                        onChangeFunctionality: handleClass,
                      ),
                    ],
                  ),
                ]),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 100,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        width: 145,
                        //height: 80,
                        child: Text(
                          "Preferred Gender",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      CustomDropDownButtonForPostTuition(
                        //value:widget.userDetails.occupation,
                        items: preferredGender.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                        // iconData: Icons.business_center_sharp,
                        onChangeFunctionality: handlePreferredGender,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        width: 145,
                        child: Text(
                          "Days In Week",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      CustomDropDownButtonForPostTuition(
                        //value:widget.userDetails.occupation,
                        items: daysInWeek.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                        // iconData: Icons.business_center_sharp,
                        onChangeFunctionality: handleDaysInWeek,
                      ),
                    ],
                  ),
                ]),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            width: 350,
            child: Text(
              "Salary",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            //height: 42,
            width: 350,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            decoration: containerDecoration,
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                  //   filled: true,
                  border: InputBorder.none),
              hint: Text(
                "Salary",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              // value: selectedValue,

              menuMaxHeight: 200,
              iconEnabledColor: Colors.grey[900],
              iconDisabledColor: Colors.grey[900],
              value: selectedSalary == '' ? null : selectedSalary,
              style: TextStyle(color: Colors.black, fontSize: 15),
              borderRadius: BorderRadius.circular(30.0),

              //underline: SizedBox(),
              isExpanded: true,
              dropdownColor: Colors.grey[100],
              onChanged: (value) {
                handleSalary(value.toString());
              },
              items: Salaries.map((valueItem) {
                return DropdownMenuItem(
                  value: valueItem,
                  child: Text(valueItem),
                );
              }).toList(),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            width: 350,
            child: Text(
              "Subjects",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            height: 50,
            width: 350,
            decoration: containerDecoration,
            child: TextFormField(
              validator: (value) {
                //value = value.toString();
                if (value == null || value.isEmpty) {
                  return "Subjects";
                }
                return null;
              },
              cursorColor: Colors.grey[900],
              controller: subjectEditingController,
              decoration: normalDecoration,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            width: 350,
            child: Text(
              "Location",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            height: 50,
            width: 350,
            decoration: containerDecoration,
            child: TextFormField(
              validator: (value) {
                //value = value.toString();
                if (value == null || value.isEmpty) {
                  return "please enter Your Location";
                }
                return null;
              },
              cursorColor: Colors.grey[900],
              controller: locationEditingController,
              decoration: normalDecoration,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 50,
            width: 366,
            child: Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // POST THE TUITION
                },
                child: Text(
                  "Update Post",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Colors.lightBlue.shade400),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)))),
              ),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
