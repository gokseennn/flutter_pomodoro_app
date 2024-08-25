// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/common/controller/bottom_nav_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController navController =
        Get.put<BottomNavController>(BottomNavController(), permanent: true);
    if (Get.currentRoute == '/home') {
      navController.selectedIndex.value = 1;
    }
    return Container(
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black, width: 1))),
      child: BottomNavigationBar(
        backgroundColor: const Color(0xFFE8E8E8),
        currentIndex: navController.selectedIndex.value,
        onTap: navController.changeTabIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        items: [
          BottomNavigationBarItem(
            icon: SizedBox(
                child: SvgPicture.asset(
              'assets/icons/pomodoro.svg',
              color: navController.selectedIndex.value == 0
                  ? Colors.black
                  : Colors.grey,
            )),
            label: 'Pomodoro',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              color: navController.selectedIndex.value == 1
                  ? Colors.black
                  : Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/statistic.svg',
              color: navController.selectedIndex.value == 2
                  ? Colors.black
                  : Colors.grey,
            ),
            label: 'Statistics',
          ),
        ],
      ),
    );
  }
}
