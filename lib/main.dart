import 'package:eduhome_project/firebase_options.dart';
import 'package:eduhome_project/pages/authenticate/signInStudent.dart';
import 'package:eduhome_project/services/authenticate/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:eduhome_project/pages/landing/landingPage.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthenticationRepository()));
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
