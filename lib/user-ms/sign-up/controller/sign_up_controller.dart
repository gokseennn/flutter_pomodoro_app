import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/user-ms/sign-up/controller/sign_up_repository.dart';
import 'package:pomodoro_app/user-ms/sign-up/model/sign_in_dto.dart';

class SignUpController extends GetxController {
  final _repository = Get.find<SignUpRepository>();
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final isEmailValid = true.obs;
  final isPasswordValid = true.obs;
  final isRepeatPasswordValid = true.obs;

  void signUp() async {
    if (formKey.currentState!.validate()) {
      var response = await _repository.signIn(SignInDto(
          email: emailController.text,
          password: passwordController.text,
          phoneNumber: phoneNumberController.text));
      if (response == true) {
        Get.toNamed('/sign-in');
      }
    }
  }

  void validateEmail() {
    final emailRegex = RegExp(r"^[a-zA-Z0-9._-]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    isEmailValid.value = emailRegex.hasMatch(emailController.text);
  }

  void validatePassword() {
    isPasswordValid.value = passwordController.text.length >= 8;
  }

  void validateRepeatPassword() {
    isRepeatPasswordValid.value =
        repeatPasswordController.text == passwordController.text;
  }
}
