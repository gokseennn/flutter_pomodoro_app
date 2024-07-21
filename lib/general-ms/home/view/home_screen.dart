import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro_app/common/common_screen.dart';
import 'package:pomodoro_app/general-ms/home/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return CommonScreen<HomeController>(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        body: (controller) {
          return [
            Column(
              children: [
                Text(
                  'daisy',
                  style: GoogleFonts.quicksand(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
                SvgPicture.asset('assets/cat/daisy.svg'),
              ],
            ),
          ];
        });
  }
}
