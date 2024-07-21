import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/common/components/common_header.dart';

class CommonScreen<T> extends GetView<T> {
  final List<Widget> Function(T) body;
  final PreferredSizeWidget? appBar;
  final Future<void> Function()? onRefresh;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const CommonScreen({
    super.key,
    required this.body,
    this.appBar,
    this.onRefresh,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60), child: CommonHeader()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SafeArea(
          child: RefreshIndicator(
            color: Get.theme.colorScheme.secondary,
            onRefresh: onRefresh ?? () async {},
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: crossAxisAlignment,
                mainAxisAlignment: mainAxisAlignment,
                children: body(controller),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
