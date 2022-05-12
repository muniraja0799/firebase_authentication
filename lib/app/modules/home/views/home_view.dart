import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/constants.dart';
import 'package:firebase_authentication/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final _auth = FirebaseAuth.instance;
  final User user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Signed In As',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    user.email!,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 10.0),
                  CustomButton(
                    onPressed: () {
                      _auth.signOut();
                      Get.toNamed('/welcome');
                    },
                    text: 'Logout',
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
