import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro_app/common/controller/drawer_controller.dart';

class CommonHeader extends StatelessWidget {
  CommonHeader({super.key, this.title});
  final String? title;
  final DrawerAppController drawerController = Get.find<DrawerAppController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 250, 229),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          IconButton(
            onPressed: drawerController.openDrawer,
            icon: SvgPicture.asset(
              'assets/icons/nav_button.svg',
              width: 28,
            ),
          ),
          if (title != null)
            Text(
              title!,
              style: GoogleFonts.quicksand(
                fontSize: 24,
              ),
            ),
          const Spacer(),
          SvgPicture.asset(
            'assets/icons/app_bar_fish.svg',
            width: 40,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8),
            child: Text("27"),
          )
        ],
      ),
    );
  }
}
