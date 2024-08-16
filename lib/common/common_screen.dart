import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/common/components/bottom_nav_bar.dart';
import 'package:pomodoro_app/common/components/common_header.dart';

class CommonScreen<T> extends GetView<T> {
  final List<Widget> Function(T) body;
  final PreferredSizeWidget? appBar;
  final bool showAppbar;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final String? title;
  final bool showIcon;
  final bool showNavBar;
  const CommonScreen(
      {super.key,
      this.showNavBar = true,
      required this.body,
      this.appBar,
      this.showIcon = false,
      this.showAppbar = true,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE8E8E8),
        key: GlobalKey<ScaffoldState>(),
        appBar: showAppbar
            ? PreferredSize(
                preferredSize: const Size.fromHeight(70),
                child: CommonHeader(
                  title: title,
                  showIcon: showIcon,
                ),
              )
            : null,
        body: Builder(
          builder: (BuildContext context) {
            Get.put<ScaffoldState>(Scaffold.of(context), permanent: false);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SafeArea(
                child: SizedBox(
                  width: double.infinity,
                  height: Get.height,
                  child: Column(
                    crossAxisAlignment: crossAxisAlignment,
                    mainAxisAlignment: mainAxisAlignment,
                    children: body(controller),
                  ),
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: showNavBar ? const BottomNavBar() : null);
  }
}
