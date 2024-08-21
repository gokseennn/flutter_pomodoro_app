import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/common/controller/base_controller.dart';
import 'package:pomodoro_app/common/services/auth_service/auth_service.dart';
import 'package:pomodoro_app/general-ms/home/view/home_screen.dart';

class SignInController extends BaseController {
  final _authService = Get.find<AuthService>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final isEmailValid = true.obs;
  final isPasswordValid = true.obs;

  void signIn() async {
    if (formKey.currentState!.validate()) {
      await _authService.login(emailController.text, passwordController.text);
      print(_authService.user);
      if (_authService.user != null) {
        Get.offAllNamed(HomeScreen.routeName);
      }
    }

    void validateEmail() {
      final emailRegex = RegExp(r"^[a-zA-Z0-9._-]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
      isEmailValid.value = emailRegex.hasMatch(emailController.text);
    }

    void validatePassword() {
      isPasswordValid.value = passwordController.text.length >= 8;
    }
  }
}
