import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final phoneEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  //final isPassword = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneEditingController.dispose();
    passwordEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const IconData person_rounded =
        IconData(0xf0071, fontFamily: 'MaterialIcons');
    const IconData key_outlined =
        IconData(0xf0624, fontFamily: 'MaterialIcons');
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins"),
            ),
            Text(
              "Sign in to your account",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 40,
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
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: TextFormField(
                validator: (value) {
                  //value = value.toString();
                  if (value == null || value.isEmpty) {
                    return "please enter phone number";
                  }
                  return null;
                },
                cursorColor: Colors.grey[900],
                controller: phoneEditingController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    person_rounded,
                    color: Colors.grey[600],
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    //borderSide: BorderSide(width: 3.0),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderSide:
                          BorderSide(width: 3, color: Colors.green.shade400),
                      borderRadius: BorderRadius.circular(50.0)),

                  // suffixIcon: Builder(builder: builder)
                ),
              ),
            ),
            SizedBox(
              height: 20,
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
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return "Please Enter Password with length at least 6";
                  }
                  return null;
                },
                cursorColor: Colors.grey[900],
                obscureText: _obscureText,
                controller: passwordEditingController,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      key_outlined,
                      color: Colors.grey[600],
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      //borderSide: BorderSide(width: 3.0),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderSide:
                            BorderSide(width: 3, color: Colors.green.shade400),
                        borderRadius: BorderRadius.circular(50.0)),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.visibility,
                        color: Colors.grey[600],
                      ),
                      onPressed: () {
                        if (_obscureText) {
                          _obscureText = false;
                        } else {
                          _obscureText = true;
                        }
                        setState(() {});
                      },
                    )
                    // suffixIcon: Builder(builder: builder)
                    ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 322,
              height: 42,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(
                        int.parse("#00CC99".substring(1, 7), radix: 16) +
                            0xFF000000),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0))),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Done')),
                    );
                  }
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(
                            int.parse("#00CC99".substring(1, 7), radix: 16) +
                                0xFF000000),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ))
              ],
            )
          ],
        ),
      )),
    );
  }
}
