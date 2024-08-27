import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/common/common_screen.dart';
import 'package:pomodoro_app/common/components/common_text_form_field.dart';
import 'package:pomodoro_app/user-ms/sign-in/view/sign_in_screen.dart';
import 'package:pomodoro_app/user-ms/sign-up/controller/sign_up_controller.dart';
import 'package:pomodoro_app/user-ms/sign-up/view/components/phone_number.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static const String routeName = '/sign-up';

  @override
  Widget build(BuildContext context) {
    return CommonScreen<SignUpController>(
        showNavBar: false,
        showIcon: true,
        body: (controller) {
          return [
            Form(
              key: controller.formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12)
                    .add(const EdgeInsets.only(top: 12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sign up",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 42),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: CommonTextFormField(
                        controller: controller.emailController,
                        text: "Email Address",
                        hintText: "example@examaple.com",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email address';
                          }
                          final emailRegex = RegExp(
                              r"^[a-zA-Z0-9._-]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                          if (!emailRegex.hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: CommonTextFormField(
                        controller: controller.passwordController,
                        text: "PASSWORD",
                        hintText: "***********",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: CommonTextFormField(
                        controller: controller.repeatPasswordController,
                        text: "REPEAT PASSWORD",
                        hintText: "***********",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please repeat the password';
                          }
                          if (value != controller.passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ),
                    PhoneNumber(
                      phoneNumberController: controller.phoneNumberController,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                                style: ButtonStyle(
                                    overlayColor: WidgetStateProperty.all(
                                        Colors.white.withOpacity(0.1)),
                                    backgroundColor:
                                        WidgetStateProperty.all(Colors.black)),
                                onPressed: () {
                                  controller.signUp();
                                },
                                icon: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 32,
                                )),
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text("Already have an account?",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ),
                            InkWell(
                              onTap: () =>
                                  Get.offAllNamed(SignInScreen.routeName),
                              child: const Text("Login",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ];
        });
  }
}
