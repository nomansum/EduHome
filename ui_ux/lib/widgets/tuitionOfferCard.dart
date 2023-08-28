import 'package:flutter/material.dart';

class TuitionOfferCard extends StatelessWidget {
  final String studentName;
  final String picturePath;
  final String studentClass;
  final String location;
  final String note;
  final VoidCallback onAcceptPressed;
  final VoidCallback onRejectPressed;

  TuitionOfferCard({
    required this.studentName,
    required this.picturePath,
    required this.studentClass,
    required this.location,
    required this.note,
    required this.onAcceptPressed,
    required this.onRejectPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: MediaQuery.of(context).size.width - 48,
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
                  picturePath,
                  //  'https://images.unsplash.com/photo-1581382575275-97901c2635b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1287&q=80',
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
                  studentName,
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
                  studentClass.toString(),
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
                  location,
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
                note,
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
                  onPressed: onAcceptPressed,
                  child: Text(
                    'Accept',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 49, 185, 77),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the border radius here
                        side: BorderSide(
                          color: Colors.black, // Adjust the border color here
                          width: 2.0, // Adjust the border thickness here
                        ),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(150.0, 40.0), // Adjust the width and height here
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: onRejectPressed,
                  child: Text(
                    'Reject',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 198, 59, 59),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the border radius here
                        side: BorderSide(
                          color: Colors.black, // Adjust the border color here
                          width: 2.0, // Adjust the border thickness here
                        ),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(150.0, 40.0), // Adjust the width and height here
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
