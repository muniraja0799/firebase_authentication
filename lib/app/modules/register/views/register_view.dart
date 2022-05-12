import 'package:firebase_authentication/constants.dart';
import 'package:firebase_authentication/widgets/custom_button.dart';
import 'package:firebase_authentication/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 52),
                        Text(
                          'Register to our App',
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
                              "Already have an account? ",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed('/login');
                              },
                              child: Text(
                                'Login',
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
                          prefixicon: Icons.email,
                          hint: 'Email',
                          obsecureText: false,
                          enableSuggestions: true,
                          autocorrect: false,
                          onChanged: (value) {
                            controller.emailAddress.value = value;
                          },
                        ),
                        SizedBox(
                          height: 16,
                          child: Text(''),
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
                              (controller.password.value);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        CustomButton(
                          onPressed: () {
                            controller.signUp();
                          },
                          text: 'Register',
                        ),
                        SizedBox(height: 25),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Wrap(
                            children: [
                              Text(
                                'By signing up to mandroid you agree to our',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: lightTextColor,
                                ),
                              ),
                              Text(
                                'terms and conditions',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: purpleColor,
                                ),
                              ),
                            ],
                          ),
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
