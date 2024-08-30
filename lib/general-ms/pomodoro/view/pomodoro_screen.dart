import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pomodoro_app/common/common_screen.dart';
import 'package:pomodoro_app/general-ms/pomodoro/controller/pomodoro_controller.dart';
import 'package:pomodoro_app/general-ms/pomodoro/view/components/circular_timer.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({super.key});
  static const String routeName = '/pomodoro';
  @override
  Widget build(BuildContext context) {
    return CommonScreen<PomodoroController>(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        body: (controller) {
          return [
            const SizedBox(),
            Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: CircularTimer(
                  controller: controller,
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
