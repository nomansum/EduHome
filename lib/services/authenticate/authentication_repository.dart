
import 'package:eduhome_project/pages/landing/landingPage.dart';
import 'package:eduhome_project/pages/student/studentHome.dart';
import 'package:eduhome_project/services/authenticate/signup_email_password_failure.dart';
import 'package:get/get.dart';

import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository extends GetxController{

static AuthenticationRepository get instance => Get.find();



final _auth = FirebaseAuth.instance;

late final Rx<User?> firebaseUser;


@override
void onReady(){
  firebaseUser = Rx<User?>(_auth.currentUser);

firebaseUser.bindStream(_auth.userChanges());

 ever(firebaseUser,_setInitialScreen);


}
_setInitialScreen(User? user){
  
  user==null? Get.offAll(()=>landingPage()):Get.offAll(()=>studentHome());
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

    }
    catch(e){

    }
 

}

Future<void> logout() async => _auth.signOut();




}