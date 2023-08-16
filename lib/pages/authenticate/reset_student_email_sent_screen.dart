import 'package:eduhome_project/constants/input_decoration.dart';
import 'package:eduhome_project/pages/authenticate/otp_screen.dart';
import 'package:eduhome_project/pages/authenticate/signInStudent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetStudentEmailSentScreen extends StatefulWidget {

  final String email;

   ResetStudentEmailSentScreen({required this.email});

  @override
  State<ResetStudentEmailSentScreen> createState() => _ResetStudentEmailSentScreenState();
}

class _ResetStudentEmailSentScreenState extends State<ResetStudentEmailSentScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
            
                   children: [
                    SizedBox(height: 25,),
                
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      CircleAvatar(
                        minRadius: 150,
                        backgroundImage: AssetImage('assets/forgotPassword2.png'),
                        backgroundColor: Colors.white,
                      )
                      
                      ]
                    ),
                    SizedBox(height: 15,),
          
          
                    Text("Forgot Password!",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins"
                    ),),
                     Text("Recovery Link Sent To ",
                     textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins"
                    ),),
                    Text(widget.email,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w900,
                      fontSize: 30
                    ),
                    ),
    
                   
                    const SizedBox(height: 15,),
                       
                        Container(
                  width: MediaQuery.of(context).size.width-30,
                  height: 42,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(
                          int.parse("#00CC99".substring(1, 7), radix: 16) +
                              0xFF000000),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0))),
                    onPressed: () {
                    //
                    Get.offAll(()=>SignInStudent());

                    },
                    child: Text(
                    "Back To Student Login",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                  ),
                ),
    
                  
    
    
    
                    
          
               
            
            
            
            
            
                   ],
            
              ),
            ),
          ),
    
    
    
    
      ),
    );
  }
}