import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class CommonHeader extends StatelessWidget {
  const CommonHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      color: const Color.fromARGB(255, 255, 250, 229),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/nav_button.svg',
            width: 20,
          ),
          const Spacer(),
          SvgPicture.asset(
            'assets/icons/app_bar_fish.svg',
          ),
        ],
      ),
    );
  }
}
