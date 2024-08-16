import 'package:flutter/material.dart';
import 'package:pomodoro_app/common/common_screen.dart';
import 'package:pomodoro_app/user-ms/profile/controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return CommonScreen<ProfileController>(body: (controller) {
      return [];
    });
  }
}
