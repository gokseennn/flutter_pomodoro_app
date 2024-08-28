import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/common/components/bottom_nav_bar.dart';
import 'package:pomodoro_app/common/components/common_header.dart';
import 'package:pomodoro_app/common/components/shimmer.dart';
import 'package:pomodoro_app/common/controller/base_controller.dart';

class CommonScreen<T extends BaseController> extends GetView<T> {
  final List<Widget> Function(T) body;
  final PreferredSizeWidget? appBar;
  final bool showAppbar;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final String? title;
  final bool showIcon;
  final bool showNavBar;

  const CommonScreen({
    super.key,
    required this.body,
    this.appBar,
    this.showAppbar = true,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.title,
    this.showIcon = false,
    this.showNavBar = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8E8E8),
      appBar: showAppbar
          ? PreferredSize(
              preferredSize: const Size.fromHeight(70),
              child: CommonHeader(
                title: title,
                showIcon: showIcon,
              ),
            )
          : null,
      body: Obx(() {
        if (controller.status.value.isSuccess) {
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
        } else {
          return const ShimmerList();
        }
      }),
      bottomNavigationBar: showNavBar ? const BottomNavBar() : null,
    );
  }
}
