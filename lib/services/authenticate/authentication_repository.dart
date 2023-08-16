
//import 'dart:html';

import 'package:eduhome_project/pages/authenticate/email_verification.dart';
import 'package:eduhome_project/pages/authenticate/signInStudent.dart';
import 'package:eduhome_project/pages/landing/landingPage.dart';
import 'package:eduhome_project/pages/landing/studentLanding.dart';
import 'package:eduhome_project/pages/landing/teacherLanding.dart';
import 'package:eduhome_project/pages/student/studentHome.dart';
import 'package:eduhome_project/services/authenticate/signup_email_password_failure.dart';
import 'package:get/get.dart';

import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository extends GetxController{

static AuthenticationRepository get instance => Get.find();



final _auth = FirebaseAuth.instance;

late final Rx<User?> firebaseUser;
var verificationId = ''.obs;
var userType = ''.obs;

@override
void onReady(){
  firebaseUser = Rx<User?>(_auth.currentUser);

 // print(_auth.currentUser?.email);

firebaseUser.bindStream(_auth.userChanges());

//setInitialScreen(_auth.currentUser);



}

void authReload(){
  _auth.currentUser?.reload();
}

User? getCurrentUser(){
  
  return _auth.currentUser;

}


setInitialScreen(User? user)async{

  
final userTypeValue = userType.value.toString().toLowerCase();

 
 
  
  if(user==null){
    Get.offAll(()=>landingPage());
  }

  else if(user!.emailVerified && userTypeValue=="tutor"){
     Get.offAll(()=>TeacherLandingPage());
  }
  else if(user!.emailVerified && userTypeValue=="student"){
        Get.offAll(()=>StudentLandingPage())   ; 
  }
  else if(user!.emailVerified == false ){
    Get.offAll(()=>EmailVerification());
  }
  else {
    this.logout();
    Get.offAll(()=>landingPage());
  }



}


Future<void> loginUserWithEmailAndPassword(String email,String password)async{
 
  try{
    await _auth.signInWithEmailAndPassword(email: email, password: password);

  } on FirebaseAuthException catch(e){
    throw e.code;
  }
  catch (e){
    throw e;
  }

}
Future<void> resetPassword(String email)async{

try{
    await _auth.sendPasswordResetEmail(email: email);

}
catch(e){

  print("Password Reset Failed!");

    throw e;
}


}


Future<void> createUserWithEmailAndPassword(String email,String password) async{
   
    try{

      await _auth.createUserWithEmailAndPassword(email: email, password: password);


    } on FirebaseAuthException catch(e){
    
    final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
    print('FIREBASE AUTH EXCEPTION - ${ex.message}');

    throw ex;


    }
    catch(e){
   
   const ex = SignUpWithEmailAndPasswordFailure();

   print("EXCEPTION - ${ex.message}");
   throw ex;

    }
 

}

Future<void> loginWithEmailAndPassword(String email,String password) async{
   
    try{

      await _auth.signInWithEmailAndPassword(email: email, password: password);
      

    } on FirebaseAuthException catch(e){
         throw e;
    }
    catch(e){
    throw e;
    }
 

}

Future<void> sendEmailVerification()async{
 
   try{
     await  _auth.currentUser?.sendEmailVerification();

   }on FirebaseAuthException catch (e){
    final ex = e.code;
    throw ex;
   }
catch(_){
   
   throw _;



}


}



Future<void> phoneAuthentication(String phoneNo)async{


await _auth.verifyPhoneNumber(
  phoneNumber: phoneNo,
  verificationCompleted: (credential)async{
  await _auth.signInWithCredential(credential);
  },
   verificationFailed: (e){
       if(e.code == 'invalid-phone-number'){
          Get.snackbar('Error',"The Provided Phone Number is not valid");
       }
       else {
        Get.snackbar("Error", "Something went wrong");
       }
   }, 
   codeSent: (verificationId,resendToken){
    this.verificationId.value = verificationId;

   }, 
   codeAutoRetrievalTimeout: (verificationId){
       this.verificationId.value = verificationId;
   }
   );


}

Future<bool> verifyOTP(String otp) async {

    var credentials = await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationId.value, smsCode: otp));

return credentials.user !=null?true:false;

}







Future<void> logout() async => await _auth.signOut();




}