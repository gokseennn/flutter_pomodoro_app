import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro_app/common/common_screen.dart';
import 'package:pomodoro_app/user-ms/wardrobe/controller/wardrobe_controller.dart';

class WardrobeScreen extends StatelessWidget {
  const WardrobeScreen({super.key});
  static const routeName = "/wardrobe";
  @override
  Widget build(BuildContext context) {
    return CommonScreen<WardrobeController>(
      title: "wardrobe",
      body: (controller) => [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Satır başına iki öğe
                crossAxisSpacing: 10.0, // Satırlar arasındaki boşluk
                mainAxisSpacing: 10.0, // Sütunlar arasındaki boşluk
                childAspectRatio: 1, // Öğelerin en-boy oranı
              ),
              itemCount: 20, // GridView'da kaç öğe olacağını belirler
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Center(
                      child: Column(
                    children: [],
                  )),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
