import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro_app/user-ms/profile/view/profile_screen.dart';

class CommonHeader extends StatelessWidget {
  const CommonHeader({super.key, this.title, required this.showIcon});
  final String? title;
  final bool showIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color(0xFFE8E8E8),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ).add(EdgeInsets.only(top: MediaQuery.of(context).padding.top + 8)),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (title != null)
                    Text(
                      title!,
                      style: GoogleFonts.quicksand(
                        fontSize: 24,
                      ),
                    ),
                  if (showIcon == true)
                    Center(child: SvgPicture.asset('assets/icons/pomo.svg')),
                  if (title == null && showIcon == false)
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(ProfileScreen.routeName);
                              },
                              child: Container(
                                width: 45,
                                height: 45,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Text(
                              "Pomodoro",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: Divider(
            height: 2,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
