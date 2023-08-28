import 'package:ui_ux/constants/icon_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Icon(
                backArrowButton,
                color: Colors.grey[900],
              ),
            ),
          ),
          Text(
            "Sign Up",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 15,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
