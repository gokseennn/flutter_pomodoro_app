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
                    fontSize: 48,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: SvgPicture.asset('assets/cat/test.svg'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Text(
                    "30:00",
                    style: GoogleFonts.quicksand(fontSize: 64),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFCCE5FF),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 15),
                    ),
                    onPressed: () {
                      // Buton tıklandığında yapılacak işlemler
                    },
                    child: Text(
                      'care',
                      style: GoogleFonts.quicksand(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ];
        });
  }
}
