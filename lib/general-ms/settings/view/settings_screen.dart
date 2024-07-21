import 'package:flutter/material.dart';
import 'package:pomodoro_app/common/common_screen.dart';
import 'package:pomodoro_app/general-ms/settings/controller/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  static const String routeName = '/settings';
  @override
  Widget build(BuildContext context) {
    return CommonScreen<SettingsController>(
        body: (controller) => [
              ListTile(
                leading: const Icon(Icons.account_circle,
                    size: 30), // Kendi ikon dosyanızı buraya ekleyin
                title: const Text(
                  'my account',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  // Tıklama işlevini buraya ekleyin
                },
              ),
              ListTile(
                leading: const Icon(Icons.privacy_tip,
                    size: 30), // Kendi ikon dosyanızı buraya ekleyin
                title: const Text(
                  'privacy policy',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  // Tıklama işlevini buraya ekleyin
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout,
                    size: 30), // Kendi ikon dosyanızı buraya ekleyin
                title: const Text(
                  'log out',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  // Tıklama işlevini buraya ekleyin
                },
              ),
            ],
        title: 'Settings');
  }
}
