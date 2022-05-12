// ignore_for_file: unnecessary_overrides

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final pwdController = TextEditingController();
  final emailController = TextEditingController();
  var showSpinner = false.obs;
  final RxString emailAddress = ''.obs;
  final RxString password = ''.obs;
  @override
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future reset() async {
    showSpinner.value = !showSpinner.value;
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailAddress.value.trim(),
      );
      Get.snackbar('Reset password', 'password reset email sent',
          backgroundColor: kBackgroundColor,
          colorText: Colors.yellow,
          snackStyle: SnackStyle.FLOATING,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 5));
      Get.toNamed('/login');
      showSpinner.value = !showSpinner.value;
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Reset password',
        e.message!,
        backgroundColor: kBackgroundColor,
        colorText: Colors.yellow,
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 5),
      );
      showSpinner.value = !showSpinner.value;
    }
  }
}
