// ignore_for_file: unnecessary_overrides
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final _auth = FirebaseAuth.instance;
  var isHiddenPassword = true.obs;
  var showSpinner = false.obs;
  final RxString emailAddress = ''.obs;
  final RxString password = ''.obs;

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

  Future<void> signIn() async {
    showSpinner.value = !showSpinner.value;
    try {
      await _auth.signInWithEmailAndPassword(
          email: emailAddress.value, password: password.value);
      Get.toNamed('/home');
      showSpinner.value = !showSpinner.value;
    } on FirebaseAuthException catch (e) {
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
