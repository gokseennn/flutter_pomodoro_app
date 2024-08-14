import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
