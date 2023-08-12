import 'package:eduhome_project/constants/dropdown_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants/icon_constants.dart';
import '../constants/input_decoration.dart';

class SubjectSalary extends StatefulWidget {
  //const SubjectSalary({super.key});
  final String hintText;
  final double salaryWidth;
  final Function onChangeFunctionality;

  SubjectSalary(
      {required this.hintText,
      required this.salaryWidth,
      required this.onChangeFunctionality});
  @override
  State<SubjectSalary> createState() => _SubjectSalaryState();
}

class _SubjectSalaryState extends State<SubjectSalary> {
  String selectedValue = "";
  bool isStudent = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 42,
      width: widget.salaryWidth,
      decoration: containerDecoration,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
            //   filled: true,
            border: InputBorder.none),
        hint: Text(
          widget.hintText,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        // value: selectedValue,

        menuMaxHeight: 200,
        iconEnabledColor: Colors.grey[900],
        iconDisabledColor: Colors.grey[900],
        value: selectedValue == '' ? null : selectedValue,
        style: TextStyle(color: Colors.black, fontSize: 15),
        borderRadius: BorderRadius.circular(30.0),

        //underline: SizedBox(),
        isExpanded: true,
        dropdownColor: Colors.grey[100],
        onChanged: (value) {
          widget.onChangeFunctionality(value);
        },
        items: salaryList.map((valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(valueItem),
          );
        }).toList(),
      ),
    );
  }
}
