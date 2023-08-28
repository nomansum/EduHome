import 'package:flutter/material.dart';
import 'package:ui_ux/pages/landing/landingPage.dart';

import 'package:ui_ux/firebase_options.dart';
import 'package:ui_ux/pages/authenticate/email_verification.dart';
import 'package:ui_ux/pages/authenticate/signInStudent.dart';
import 'package:ui_ux/pages/authenticate/teacher_register.dart';
import 'package:ui_ux/services/authenticate/authentication_repository.dart';
import 'package:ui_ux/services/storage_repo.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ui_ux/pages/authenticate/email_verification.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) {
    Get.put(AuthenticationRepository());
    Get.put(StorageRepo());
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialRoute: '/studentHome',
      // routes: {
      //   '/studentNotifications': (context) => studentNotification(),
      //   '/studentHome': (context) => studentHome(),
      // },
      themeMode: ThemeMode.system,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      home: landingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:ui_ux/pages/authenticate/forget_password_mail.dart';
// import 'package:ui_ux/pages/landing/landingPage.dart';

// import 'package:ui_ux/firebase_options.dart';
// import 'package:ui_ux/pages/authenticate/email_verification.dart';
// import 'package:ui_ux/pages/authenticate/signInStudent.dart';
// import 'package:ui_ux/pages/authenticate/teacher_register.dart';
// import 'package:ui_ux/services/authenticate/authentication_repository.dart';
// import 'package:ui_ux/services/storage_repo.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:ui_ux/pages/authenticate/email_verification.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
//       .then((value) {
//     Get.put(AuthenticationRepository());
//     Get.put(StorageRepo());
//   });
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       initialRoute: '/', // Set the initial route if needed
//       getPages: [
//         // Define your routes here
//         GetPage(name: '/', page: () => landingPage()), // Example
//         GetPage(
//             name: '/forgotPasswordMail',
//             page: () => ForgotPasswordMailScreen()),
//         // Define other routes
//       ],
//       themeMode: ThemeMode.system,
//       defaultTransition: Transition.leftToRightWithFade,
//       transitionDuration: const Duration(milliseconds: 500),
//       home: landingPage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
