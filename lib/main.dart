import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/general-ms/general_routes.dart';
import 'package:pomodoro_app/general-ms/welcome/controller/welcome_binding.dart';
import 'package:pomodoro_app/general-ms/welcome/view/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: WelcomeBinding(),
        initialRoute: WelcomeScreen.routeName,
        getPages: GeneralRoutes.routes);
  }
}
