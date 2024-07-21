import 'package:flutter/material.dart';
import 'package:pomodoro_app/common/common_screen.dart';
import 'package:pomodoro_app/user-ms/my_pets/controller/my_pets_controller.dart';

class MyPets extends StatelessWidget {
  const MyPets({super.key});
  static const routeName = "/my-pets";
  @override
  Widget build(BuildContext context) {
    return CommonScreen<MyPetsController>(
        body: (controller) => [const Text("data")]);
  }
}
