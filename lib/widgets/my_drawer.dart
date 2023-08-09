

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int clickPhysics = 0,
      clickMath = 0,
      clickChemistry = 0,
      clickEnglish = 0,
      clickBiology = 0,
      clickBangla = 0,
      clickMale = 0,
      clickFemale = 0,
      clickLessOne = 0,
      clickOneToThree = 0,
      clickThreeToFive = 0,
      clickFiveToSeven = 0,
      clickSevenPlus = 0,
      click2k = 0,
      click3k = 0,
      click7k = 0,
      click5k = 0,
      click10k = 0,
      click1s = 0,
      click2s = 0,
      click3s = 0,
      click4s = 0,
      click5s = 0;
  // Color buttonColor = Colors.grey;

  int _onButtonPressed(int clickCount) {
    int clickCounter = clickCount;
    setState(
      () {
        clickCounter++;
      },
    );
    return clickCounter;
  }

  Color getButtonColor(int clickCount) {
    return clickCount % 2 == 0 ? Colors.grey : Color(0xFF00BFA5);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          //  padding: EdgeInsets.zero,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          clickPhysics = _onButtonPressed(clickPhysics);
                        },
                        child: Text('Physics'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: getButtonColor(clickPhysics),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          clickMath = _onButtonPressed(clickMath);
                        },
                        child: Text('Math'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: getButtonColor(clickMath),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          clickChemistry = _onButtonPressed(clickChemistry);
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
                        },
                        child: Text('English'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: getButtonColor(clickEnglish),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          clickBiology = _onButtonPressed(clickBiology);
                        },
                        child: Text('Biology'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: getButtonColor(clickBiology),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          clickBangla = _onButtonPressed(clickBangla);
                        },
                        child: Text('Bangla'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: getButtonColor(clickBangla),
                        ),
                      ),
                    ],
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
                        },
                        child: Text('Male'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: getButtonColor(clickMale),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          clickFemale = _onButtonPressed(clickFemale);
                        },
                        child: Text('Female'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: getButtonColor(clickFemale),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Experience',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          clickLessOne = _onButtonPressed(clickLessOne);
                        },
                        child: Text('<1year'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: getButtonColor(clickLessOne),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          clickOneToThree = _onButtonPressed(clickOneToThree);
                        },
                        child: Text('1-3year'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: getButtonColor(clickOneToThree),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          clickThreeToFive = _onButtonPressed(clickThreeToFive);
                        },
                        child: Text('3-5year'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: getButtonColor(clickThreeToFive),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          clickFiveToSeven = _onButtonPressed(clickFiveToSeven);
                        },
                        child: Text('5-7year'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: getButtonColor(clickFiveToSeven),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          clickSevenPlus = _onButtonPressed(clickSevenPlus);
                        },
                        child: Text('7+ year'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: getButtonColor(clickSevenPlus),
                        ),
                      ),
                    ],
                  ),

                  //----------------------------------------------------------//
                  Text(
                    'Salary Range ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          click2k = _onButtonPressed(click2k);
                        },
                        child: Text('2k-3k'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: getButtonColor(click2k),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          click3k = _onButtonPressed(click3k);
                        },
                        child: Text('3k-5k'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: getButtonColor(click3k),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          click5k = _onButtonPressed(click5k);
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
                        },
                        child: Text('7k-9k'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: getButtonColor(click7k),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          click10k = _onButtonPressed(click10k);
                        },
                        child: Text('10k+'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: getButtonColor(click10k),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Ratings',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          click1s = _onButtonPressed(click1s);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('1'),
                            SizedBox(width: 5),
                            Icon(Icons.star, color: Colors.yellow),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: getButtonColor(click1s),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          click2s = _onButtonPressed(click2s);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('2'),
                            SizedBox(width: 5),
                            Icon(Icons.star, color: Colors.yellow),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: getButtonColor(click2s),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          click3s = _onButtonPressed(click3s);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('3'),
                            SizedBox(width: 5),
                            Icon(Icons.star, color: Colors.yellow),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: getButtonColor(click3s),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          click4s = _onButtonPressed(click4s);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('4'),
                            SizedBox(width: 5),
                            Icon(Icons.star, color: Colors.yellow),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: getButtonColor(click4s),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          click5s = _onButtonPressed(click5s);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: getButtonColor(click5s),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('5'),
                            SizedBox(width: 5),
                            Icon(Icons.star, color: Colors.yellow),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Apply'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFF00BFA5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}