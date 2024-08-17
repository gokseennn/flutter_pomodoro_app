import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final isEmailValid = true.obs;
  final isPasswordValid = true.obs;

  void signIn() async {
    if (_formKey.currentState!.validate()) {}
  }

  void validateEmail() {
    final emailRegex = RegExp(r"^[a-zA-Z0-9._-]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    isEmailValid.value = emailRegex.hasMatch(emailController.text);
  }

  void validatePassword() {
    isPasswordValid.value = passwordController.text.length >= 8;
  }
}
