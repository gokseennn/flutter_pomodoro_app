import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/common/common_screen.dart';
import 'package:pomodoro_app/common/components/common_text_form_field.dart';
import 'package:pomodoro_app/general-ms/pomodoro/view/pomodoro_screen.dart';
import 'package:pomodoro_app/user-ms/sign-in/controller/sign_in_controller.dart';
import 'package:pomodoro_app/user-ms/sign-up/view/sign_up_screen.dart';

class LowercaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  static const String routeName = '/sign-in';

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return CommonScreen<SignInController>(
      showNavBar: false,
      showIcon: true,
      body: (controller) {
        return [
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Log in",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 42),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: CommonTextFormField(
                    controller: controller.emailController,
                    text: "Email Address",
                    hintText: "example@example.com",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!GetUtils.isEmail(value)) {
                        return 'Please enter a valid email';
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
                    hintText: "*********",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
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
                                WidgetStateProperty.all(Colors.black),
                          ),
                          onPressed: controller.signIn,
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                            "Don't have an account?",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: InkWell(
                            onTap: () => Get.toNamed(SignUpScreen.routeName),
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ];
      },
    );
  }
}
