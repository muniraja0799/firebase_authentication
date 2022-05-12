import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/app/modules/home/views/home_view.dart';
import 'package:firebase_authentication/app/modules/welcome/views/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Firebase Authentication",
        home: MainView(),
        getPages: AppPages.routes,
      ),
    ),
  );
}

class MainView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeView();
          } else {
            return WelcomeView();
          }
        },
      ),
    );
  }
}
