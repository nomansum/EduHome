import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class RateTeacher extends StatefulWidget {
  const RateTeacher({super.key});

  @override
  State<RateTeacher> createState() => _RateTeacherState();
}

class _RateTeacherState extends State<RateTeacher> {
  String _selectedRating = '1 Star';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SafeArea(
                child: TextButton(
                  child: Text(
                    '< Rating',
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
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1581382575275-97901c2635b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1287&q=80',
                  ),
                  radius: 50,
                ),
                Positioned(
                  bottom:
                      0, // Adjust this value to position the container vertically
                  right:
                      0, // Adjust this value to position the container horizontally
                  child: Container(
                    height: 26,
                    width: 45,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.star,
                              color: Color(0xFF38BBF8),
                            ),
                            Text(
                              '4',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(253, 219, 109, 1.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Mostahid Hasan',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Divider(
            height: 20,
            color: Colors.grey,
            thickness: 2,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(top: 2),
            width: 325,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 1,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: DropdownButtonFormField<String>(
              value: _selectedRating,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedRating = newValue ?? '';
                });
              },
              items: <String>['1 Star', '2 Star', '3 Star', '4 Star', '5 Star']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  FontAwesomeIcons.pen,
                  size: 20,
                ),
                border: InputBorder.none,
                hintText: 'Give Rating',
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.SUCCES,
                animType: AnimType.TOPSLIDE,
                showCloseIcon: true,
                title: "Success",
                desc: "Rating Submitted Successfully.",
                btnOkOnPress: () {
                  Navigator.pop(context);
                },
              ).show();
            },
            child: Text('Give Rating'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Color(0xFF00BFA5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
