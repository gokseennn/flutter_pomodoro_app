import 'package:flutter/material.dart';
import 'package:pomodoro_app/common/common_screen.dart';
import 'package:pomodoro_app/common/components/common_text_form_field.dart';
import 'package:pomodoro_app/general-ms/sign-up/controller/sign_up_controller.dart';
import 'package:pomodoro_app/general-ms/sign-up/view/components/phone_number.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static const String routeName = '/sign-up';

  @override
  Widget build(BuildContext context) {
    return CommonScreen<SignUpController>(
        showIcon: true,
        body: (controller) {
          return [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12)
                  .add(const EdgeInsets.only(top: 12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Sign up",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 42),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 24.0),
                    child: CommonTextFormField(
                      text: "Email Address",
                      hintText: "example@examaple.com",
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 24.0),
                    child: CommonTextFormField(
                      text: "PASSWORD",
                      hintText: "***********",
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 24.0),
                    child: CommonTextFormField(
                      text: "REPEAT PASSWORD",
                      hintText: "***********",
                    ),
                  ),
                  const PhoneNumber(),
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
                              onPressed: () {},
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
                          const Text("Login",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ];
        });
  }
}
