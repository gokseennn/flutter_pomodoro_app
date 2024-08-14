import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/common/common_screen.dart';
import 'package:pomodoro_app/general-ms/welcome/controller/welcome_controller.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static const String routeName = '/welcome';
  @override
  Widget build(BuildContext context) {
    return CommonScreen<WelcomeController>(
        showAppbar: false,
        body: (controller) {
          return [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 32.0),
                      child: Text(
                        "Better Way \n to Manage",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 38),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.5,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0)
                          .add(const EdgeInsets.only(bottom: 12)),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 12),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: () {},
                          child: const Text(
                            "Get Started",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )),
                    ),
                  )
                ],
              ),
            )
          ];
        });
  }
}
