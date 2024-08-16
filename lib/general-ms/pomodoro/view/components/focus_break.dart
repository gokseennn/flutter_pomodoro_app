import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pomodoro_app/general-ms/pomodoro/controller/pomodoro_controller.dart';

class FocusAndBreak extends StatelessWidget {
  const FocusAndBreak({super.key, required this.controller});
  final PomodoroController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 35,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Obx(() => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                margin: EdgeInsets.only(
                  left: controller.isFocus.value ? 0 : 100,
                  right: controller.isFocus.value ? 100 : 0,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
              )),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => controller.setFocus(true),
                  child: Center(
                    child: Obx(() => Text(
                          'FOCUS',
                          style: TextStyle(
                            color: controller.isFocus.value
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => controller.setFocus(false),
                  child: Center(
                    child: Obx(() => Text(
                          'BREAK',
                          style: TextStyle(
                            color: controller.isFocus.value
                                ? Colors.black
                                : Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
