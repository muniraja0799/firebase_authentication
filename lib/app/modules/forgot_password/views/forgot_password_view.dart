import 'package:firebase_authentication/constants.dart';
import 'package:firebase_authentication/widgets/custom_button.dart';
import 'package:firebase_authentication/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0.0,
      ),
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
                        Text(
                          'Reset password',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Hero(
                          tag: 'logo',
                          child: Image.asset(
                            'assets/images/firebase_logo.webp',
                            width: 250,
                            height: 250,
                          ),
                        ),
                        SizedBox(height: 24),
                        Text(
                          'Enter your registered email',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 24),
                        CustomFormTextField(
                          onChanged: (value) {
                            controller.emailAddress.value = value;
                          },
                          prefixicon: Icons.email,
                          hint: 'Email',
                          obsecureText: false,
                          enableSuggestions: true,
                          autocorrect: false,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        CustomButton(
                          onPressed: () {
                            controller.reset();
                          },
                          text: 'Reset',
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
}
