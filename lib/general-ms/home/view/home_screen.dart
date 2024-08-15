import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pomodoro_app/common/common_screen.dart';
import 'package:pomodoro_app/general-ms/home/controller/home_controller.dart';
import 'package:pomodoro_app/general-ms/home/view/components/circular_timer.dart';
import 'package:pomodoro_app/general-ms/home/view/components/focus_break.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return CommonScreen<HomeController>(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        body: (controller) {
          return [
            FocusAndBreak(controller: controller),
            Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Obx(
                  () => CircularTimer(
                    controller: controller,
                    initialDuration: controller.timer.value,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Obx(
                () => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 42.0, vertical: 12.0),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  onPressed: controller.toggleTimer,
                  child: Text(controller.isRunning.value ? 'PAUSE' : 'START'),
                ),
              ),
            ),
          ];
        });
  }
}
