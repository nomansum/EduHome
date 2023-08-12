import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:eduhome_project/pages/teacher/teacherNotification.dart';

class TuitionOffers extends StatefulWidget {
  const TuitionOffers({super.key});

  @override
  State<TuitionOffers> createState() => _TuitionOffersState();
}

class _TuitionOffersState extends State<TuitionOffers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 10),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1581382575275-97901c2635b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1287&q=80'),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi!',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Muntasir Mamun',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => teacherNotification(),
                  ),
                );
              },
              icon: Icon(Icons.notifications_active_outlined),
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Center(
                child: Text(
                  'Offers',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 260,
              width: 350,
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1581382575275-97901c2635b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1287&q=80',
                        ),
                        radius: 25,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "Name : ",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Muntasir Mamun",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Class : ",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "12",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Location : ",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "38/1 Akhalia,Sylhet.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Note : ",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      height: 40,
                      width: 335,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 225, 204, 13),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "I will give 3500Tk.",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.SUCCES,
                              animType: AnimType.TOPSLIDE,
                              showCloseIcon: true,
                              title: "Success",
                              desc: "Offer Accepted Successfully.",
                              btnOkOnPress: () {
                                //   Navigator.pop(context);
                              },
                            ).show();
                          },
                          child: Text(
                            'Accept',
                            style: TextStyle(fontSize: 18),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 49, 185, 77),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Adjust the border radius here
                                side: BorderSide(
                                  color: Colors
                                      .black, // Adjust the border color here
                                  width:
                                      2.0, // Adjust the border thickness here
                                ),
                              ),
                            ),
                            minimumSize: MaterialStateProperty.all<Size>(
                              Size(150.0,
                                  40.0), // Adjust the width and height here
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.WARNING,
                              animType: AnimType.TOPSLIDE,
                              showCloseIcon: true,
                              title: "Warning",
                              desc:
                                  "Are you sure you want to reject the Offer?",
                              btnCancelOnPress: () {},
                              btnOkText: "Yes",
                              btnOkOnPress: () {},
                            ).show();
                          },
                          child: Text(
                            'Reject',
                            style: TextStyle(fontSize: 18),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 198, 59, 59),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Adjust the border radius here
                                side: BorderSide(
                                  color: Colors
                                      .black, // Adjust the border color here
                                  width:
                                      2.0, // Adjust the border thickness here
                                ),
                              ),
                            ),
                            minimumSize: MaterialStateProperty.all<Size>(
                              Size(150.0,
                                  40.0), // Adjust the width and height here
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 260,
              width: 350,
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1581382575275-97901c2635b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1287&q=80',
                        ),
                        radius: 25,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "Name : ",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Muntasir Mamun",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Class : ",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "12",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Location : ",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "38/1 Akhalia,Sylhet.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Note : ",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      height: 40,
                      width: 335,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 225, 204, 13),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Class 6,2 people.4K",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.SUCCES,
                              animType: AnimType.TOPSLIDE,
                              showCloseIcon: true,
                              title: "Success",
                              desc: "Offer Accepted Successfully.",
                              btnOkOnPress: () {
                                // Navigator.pop(context);
                              },
                            ).show();
                          },
                          child: Text(
                            'Accept',
                            style: TextStyle(fontSize: 18),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 48, 208, 80),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Adjust the border radius here
                                side: BorderSide(
                                  color: Colors
                                      .black, // Adjust the border color here
                                  width:
                                      2.0, // Adjust the border thickness here
                                ),
                              ),
                            ),
                            minimumSize: MaterialStateProperty.all<Size>(
                              Size(150.0,
                                  40.0), // Adjust the width and height here
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.WARNING,
                              animType: AnimType.TOPSLIDE,
                              showCloseIcon: true,
                              title: "Warning",
                              desc:
                                  "Are you sure you want to reject the Offer?",
                              btnCancelOnPress: () {},
                              btnOkText: "Yes",
                              btnOkOnPress: () {},
                            ).show();
                          },
                          child: Text(
                            'Reject',
                            style: TextStyle(fontSize: 18),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 217, 58, 58),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Adjust the border radius here
                                side: BorderSide(
                                  color: Colors
                                      .black, // Adjust the border color here
                                  width:
                                      2.0, // Adjust the border thickness here
                                ),
                              ),
                            ),
                            minimumSize: MaterialStateProperty.all<Size>(
                              Size(150.0,
                                  40.0), // Adjust the width and height here
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
