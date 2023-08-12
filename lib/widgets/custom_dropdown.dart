import 'package:eduhome_project/constants/icon_constants.dart';
import 'package:eduhome_project/constants/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomDropDownButton extends StatefulWidget {
  //const CustomDropDownButton({super.key});
  final List<DropdownMenuItem> items;
  final IconData iconData;
  Function onChangeFunctionality;
  CustomDropDownButton(
      {required this.items,
      required this.iconData,
      required this.onChangeFunctionality});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String selectedValue = "";
  // get itemList => widget.items;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 42,
      width: 160,
      decoration: containerDecoration,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
            prefixIcon: Icon(widget.iconData),
            //   filled: true,
            border: InputBorder.none),
        hint: Text("Select"),
        // value: selectedValue,
        icon: Icon(
          arrowDropdown,
          color: Colors.grey[900],
        ),

        menuMaxHeight: 200,
        iconEnabledColor: Colors.grey[900],
        iconDisabledColor: Colors.grey[900],
        value: selectedValue == '' ? null : selectedValue,
        style: TextStyle(color: Colors.black, fontSize: 15),
        borderRadius: BorderRadius.circular(30.0),
        iconSize: 24,

        //underline: SizedBox(),
        isExpanded: true,
        dropdownColor: Colors.grey[100],
        onChanged: (value) {
          widget.onChangeFunctionality(value);
        },
        items: widget.items,
      ),
    );
  }
}
