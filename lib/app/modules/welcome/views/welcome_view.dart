import 'package:firebase_authentication/constants.dart';
import 'package:firebase_authentication/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Hero(
                    tag: 'logo',
                    child: Image.asset(
                      'assets/images/firebase_logo.webp',
                      width: 250,
                      height: 250,
                    ),
                  ),
                  Text(
                    'Firebase Authentication',
                    style: kTitleTextStyle,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  CustomButton(
                    onPressed: () {
                      Get.toNamed('/login');
                    },
                    text: 'Login',
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomButton(
                    onPressed: () {
                      Get.toNamed('/register');
                    },
                    text: 'Register',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
