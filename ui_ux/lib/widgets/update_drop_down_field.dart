import 'package:ui_ux/constants/icon_constants.dart';
import 'package:ui_ux/constants/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomDropDownButton1 extends StatefulWidget {
  //const CustomDropDownButton({super.key});
  final List<DropdownMenuItem> items;
  final IconData iconData;
  final String value;
  Function onChangeFunctionality;
  CustomDropDownButton1(
      {required this.items,
      required this.iconData,
      required this.onChangeFunctionality,
      required this.value});

  @override
  State<CustomDropDownButton1> createState() => _CustomDropDownButton1State();
}

class _CustomDropDownButton1State extends State<CustomDropDownButton1> {
  String selectedValue = "";
  // get itemList => widget.items;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 42,
      width: MediaQuery.of(context).size.width * .43,
      decoration: containerDecoration,
      child: DropdownButtonFormField(
        //value:widget.value,

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
        value: selectedValue == '' ? widget.value : selectedValue,
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
