import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:pomodoro_app/common/util.dart';
import 'package:pomodoro_app/general-ms/pomodoro/view/components/circular_timer.dart';

class PomodoroController extends GetxController
    with GetSingleTickerProviderStateMixin, StateMixin, FuturizeHelper {
  var isFocusSelected = true.obs;
  var isFocus = true.obs;

  late Timer _timer;
  var currentDuration = 0.obs;
  var isRunning = false.obs;

  final int sessionCount = 3;
  final int totalSessions = 4;
  var timer = 3600.obs;

  @override
  void onInit() async {
    futurize(() => initController());
    super.onInit();
  }

  void reset() {
    timer.value = 3600;
  }

  Future<dynamic> initController() async {
    return true;
  }

  void setFocus(bool focus) {
    isFocus.value = focus;
  }

  void initialize(int initialDuration) {
    currentDuration.value = initialDuration;
  }

  void toggleTimer() {
    isRunning.value = !isRunning.value;
    if (isRunning.value) {
      _startTimer();
    } else {
      _timer.cancel();
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentDuration > 0) {
        currentDuration.value--;
      } else {
        _timer.cancel();
        isRunning.value = false;
        Get.find<CircularTimer>().onComplete?.call();
      }
    });
  }

  @override
  void onClose() {
    if (isRunning.value) {
      _timer.cancel();
    }
    super.onClose();
  }

  String formatDuration(int duration) {
    int minutes = duration ~/ 60;
    int seconds = duration % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  String getFinishTime() {
    final now = DateTime.now();
    final finishTime = now.add(Duration(seconds: currentDuration.value));
    return '${finishTime.hour.toString().padLeft(2, '0')}:${finishTime.minute.toString().padLeft(2, '0')}';
  }
}
