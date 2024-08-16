import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/user-ms/sign-up/controller/sign_up_repository.dart';
import 'package:pomodoro_app/user-ms/sign-up/model/sign_in_dto.dart';

class SignUpController extends GetxController {
  final _repository = Get.find<SignUpRepository>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  void signUp() async {
    var response = await _repository.signIn(SignInDto(
        email: emailController.text,
        password: passwordController.text,
        phoneNumber: phoneNumberController.text));
    if (response == true) {
      Get.toNamed('/sign-in');
    } else {
      Get.snackbar('Error', 'Sign up failed');
    }
  }
}
