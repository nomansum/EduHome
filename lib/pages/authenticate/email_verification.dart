

import 'package:eduhome_project/pages/landing/landingPage.dart';
import 'package:eduhome_project/services/authenticate/authentication_repository.dart';
import 'package:eduhome_project/services/authenticate/controllers/email_verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  final controller  = Get.put(MailVerificationController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          
      
      body: Center(
        child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Icon(Icons.email_rounded,size: 40,
               ),
               Text("Verify your Email Address",
               style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                fontSize: 28
               ),),
               SizedBox(height: 30,),
                 
                Text("We have just sent email verification link\nPlease Verify Your Email Address",
               style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                fontSize: 20
               ),
               
               ) ,
               SizedBox(height: 30,),
Text("If not auto redirected please click below",
               style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                fontSize: 20
               ),),
               SizedBox(height: 40,),
               Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 42,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(
                            int.parse("#00CC99".substring(1, 7), radix: 16) +
                                0xFF000000),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0))),
                    onPressed: () {
                      
                      final user = AuthenticationRepository.instance.getCurrentUser();
                       
                       if(user!.emailVerified){
                        AuthenticationRepository.instance.setInitialScreen(user);
                       }
                       else{
                          ScaffoldMessenger.of(context).showSnackBar(
                         const SnackBar(content: Text('Not Yet Verified!!!')),
                       );
                       }
                      
                    },
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                TextButton(onPressed: (){
                  //RESENT CODE
                  Get.offAll(()=>EmailVerification());
                }, child: Text("Resend E-mail Link",
                style: TextStyle(
                  color: Colors.black87
                ),),
                ),

                SizedBox(height: 20,),
        TextButton(onPressed: (){
          // pop 
          Get.offAll(()=>landingPage());
        }, child: Text(
          "Back to LandingPage"
          ,style: TextStyle(
            color: Colors.black,
          ),
        ))
              


            ],

  


        ),
      ),







      ),
    );
  }
}