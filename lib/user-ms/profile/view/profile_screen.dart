import 'package:flutter/material.dart';
import 'package:pomodoro_app/common/common_screen.dart';
import 'package:pomodoro_app/user-ms/profile/controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return CommonScreen<ProfileController>(body: (controller) {
      return [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ACCOUNT INFO',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildAccountDetailRow('Name', 'David'),
                  const SizedBox(height: 15),
                  _buildAccountDetailRow('Email Address', 'D*****F@Gmail.com'),
                  const SizedBox(height: 15),
                  _buildAccountDetailRow('Phone', '5** *** **9',
                      showEyeIcon: true),
                  const SizedBox(height: 15),
                  _buildAccountDetailRow('Password', '********',
                      showEyeIcon: true),
                  const SizedBox(height: 20),
                  const SizedBox(height: 40),
                  const Text(
                    'NOTIFICATIONS',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildNotificationSwitch('Lock screen alert'),
                  _buildNotificationSwitch('Notification centre alert'),
                  _buildNotificationSwitch('Banner alert'),
                ],
              ),
            ),
          ),
        ),
      ];
    });
  }

  Widget _buildAccountDetailRow(String title, String value,
      {bool showEyeIcon = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.toUpperCase(),
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                if (showEyeIcon) ...[
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.black45,
                    size: 20,
                  ),
                ],
              ],
            ),
          ],
        ),
        if (!showEyeIcon)
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.black45,
            ),
            onPressed: () {
              // Düzenleme işlemleri
            },
          ),
      ],
    );
  }

  Widget _buildNotificationSwitch(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Switch(
              value: false,
              onChanged: (bool value) {
                // Bildirim ayarlarını değiştir
              },
              activeColor: Colors.black,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.black),
        ],
      ),
    );
  }
}
