// ignore_for_file: unnecessary_overrides

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final _auth = FirebaseAuth.instance;
  final pwdController = TextEditingController();
  final emailController = TextEditingController();
  var isHiddenPassword = true.obs;
  var showSpinner = false.obs;
  final RxString emailAddress = ''.obs;
  final RxString password = ''.obs;

  final count = 0.obs;
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

  Future signUp() async {
    showSpinner.value = !showSpinner.value;
    try {
      await _auth.createUserWithEmailAndPassword(
          email: emailAddress.value.trim(), password: password.value.trim());
      Get.toNamed('/home');
      showSpinner.value = !showSpinner.value;
    } on FirebaseAuthException catch (e) {
      print(e);
      Get.snackbar('Warning', e.message!,
          backgroundColor: kBackgroundColor,
          colorText: Colors.yellow,
          snackStyle: SnackStyle.FLOATING,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 5));
      showSpinner.value = !showSpinner.value;
    }
  }
}
