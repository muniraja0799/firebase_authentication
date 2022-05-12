import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/constants.dart';
import 'package:firebase_authentication/widgets/custom_button.dart';
import 'package:firebase_authentication/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../controllers/login_controller.dart';

// ignore: must_be_immutable
class LoginView extends GetView<LoginController> {
  final _auth = FirebaseAuth.instance;
  final pwdController = TextEditingController();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Obx(
        () => ModalProgressHUD(
          inAsyncCall: controller.showSpinner.value,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Center(
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 52),
                        Text(
                          'Login to continue',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Wrap(
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed('/register');
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.yellow,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Hero(
                          tag: 'logo',
                          child: Image.asset(
                            'assets/images/firebase_logo.webp',
                            width: 250,
                            height: 250,
                          ),
                        ),
                        SizedBox(height: 24),
                        SizedBox(height: 16),
                        CustomFormTextField(
                          onChanged: (value) {
                            controller.emailAddress.value = value;
                            print(controller.emailAddress.value);
                          },
                          prefixicon: Icons.email,
                          hint: 'Email',
                          obsecureText: false,
                          enableSuggestions: true,
                          autocorrect: false,
                          textEditingController: emailController,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 15.0,
                            width: double.infinity,
                            child: Text(
                              controller.validEmail.value,
                              textAlign: TextAlign.start,
                              style: TextStyle(color: Colors.yellow),
                            ),
                          ),
                        ),
                        Obx(
                          () => CustomFormTextField(
                            obsecureText: controller.isHiddenPassword.value,
                            suffixicon: GestureDetector(
                              onTap: () {
                                controller.isHiddenPassword.value =
                                    !controller.isHiddenPassword.value;
                              },
                              child: Icon(
                                controller.isHiddenPassword.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black38,
                              ),
                            ),
                            prefixicon: Icons.lock,
                            hint: 'Password',
                            enableSuggestions: false,
                            autocorrect: false,
                            onClick: () {
                              controller.isHiddenPassword.value !=
                                  controller.isHiddenPassword.value;
                            },
                            onChanged: (value) {
                              controller.password.value = value;
                              print(controller.password.value);
                            },
                            textEditingController: pwdController,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 30.0,
                            width: double.infinity,
                            child: Text(
                              controller.validCredentials.value,
                              style: TextStyle(color: Colors.yellow),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () async {},
                              child: Text(
                                'Forgot Password ?',
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.yellow),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20.0),
                        CustomButton(
                          onPressed: signIn,
                          text: 'Login',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    GetUtils.isEmail(emailController.text)
        ? controller.validEmail.value = ''
        : controller.validEmail.value = 'Email is invalid!!!';

    controller.showSpinner.value = !controller.showSpinner.value;
    try {
      await _auth.signInWithEmailAndPassword(
          email: controller.emailAddress.value,
          password: controller.password.value);
      Get.toNamed('/home');
      controller.showSpinner.value = !controller.showSpinner.value;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        controller.validCredentials.value = 'Invalid details';
        print('Wrong password provided for that user.');
      }
      controller.showSpinner.value = !controller.showSpinner.value;
    }
  }
}
