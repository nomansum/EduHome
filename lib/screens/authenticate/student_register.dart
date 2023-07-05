import 'package:eduhome_project/constants/dropdown_list.dart';
import 'package:eduhome_project/constants/icon_constants.dart';
import 'package:eduhome_project/constants/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class StudentRegister extends StatefulWidget {
  const StudentRegister({super.key});

  @override
  State<StudentRegister> createState() => _StudentRegisterState();
}

class _StudentRegisterState extends State<StudentRegister> {
  final _formKey = GlobalKey<FormState>();
  final nameEditingController = TextEditingController();
  final classEditingController = TextEditingController();
  final locationEditingController = TextEditingController();
  final phoneEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  bool _obscureText = true;
  static const IconData arrow_drop_down_circle_outlined = arrowDropdown;

  static const IconData location_on = Location;

  static const IconData smartphone = Mobile;

  static const IconData key_outlined = outlinedKey;

  String _selectedItem = "";

  final List<String> _dropdownItems = dropDownList;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameEditingController.dispose();
    classEditingController.dispose();
    locationEditingController.dispose();
    phoneEditingController.dispose();
    passwordEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "One Step Away!",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins"),
            ),
            Text(
              "Please Tell Us About You",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins"),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: 310,
              child: Text(
                "Full Name",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 42,
              width: 322,
              decoration: containerDecoration,
              child: TextFormField(
                validator: (value) {
                  //value = value.toString();
                  if (value == null || value.isEmpty) {
                    return "please enter Full Name";
                  }
                  return null;
                },
                cursorColor: Colors.grey[900],
                controller: nameEditingController,
                decoration: inputDecoration,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: 310,
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
            Container(
              height: 42,
              width: 322,
              decoration: containerDecoration,
              child: TextFormField(
                cursorColor: Colors.grey[900],
                decoration: inputDecoration.copyWith(
                    suffixIcon: PopupMenuButton(
                  icon: Icon(
                    arrow_drop_down_circle_outlined,
                    color: Colors.grey[900],
                  ),
                  itemBuilder: (context) {
                    return _dropdownItems.map((String item) {
                      return PopupMenuItem(
                        child: Text(item),
                        value: item,
                      );
                    }).toList();
                  },
                  onSelected: (String selectedItem) {
                    setState(() {
                      _selectedItem = selectedItem;
                    });
                  },
                )),
                controller: TextEditingController(text: _selectedItem ?? ''),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: 310,
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
              height: 42,
              width: 322,
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
                decoration: inputDecoration.copyWith(
                    prefixIcon: Icon(
                  location_on,
                  color: Colors.grey[900],
                )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: 310,
              child: Text(
                "Phone Number",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 42,
              width: 322,
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
                controller: phoneEditingController,
                decoration: inputDecoration.copyWith(
                    prefixIcon: Icon(
                  smartphone,
                  color: Colors.grey[900],
                )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: 310,
              child: Text(
                "Password",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 42,
              width: 322,
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
                controller: passwordEditingController,
                obscureText: _obscureText,
                decoration: inputDecoration.copyWith(
                    prefixIcon: Icon(
                      key_outlined,
                      color: Colors.grey[900],
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.visibility,
                        color: Colors.grey[900],
                      ),
                      onPressed: () {
                        if (_obscureText) {
                          _obscureText = false;
                        } else {
                          _obscureText = true;
                        }
                        setState(() {});
                      },
                    )),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
