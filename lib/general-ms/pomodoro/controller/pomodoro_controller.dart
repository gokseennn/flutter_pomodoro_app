import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/common/controller/base_controller.dart';
import 'package:pomodoro_app/general-ms/pomodoro/controller/pomodoro_repository.dart';
import 'package:pomodoro_app/general-ms/pomodoro/model/add_study_dto.dart';

class PomodoroController extends BaseController {
  final PomodoroRepository _repository = Get.find<PomodoroRepository>();

  final RxBool isFocus = true.obs;
  RxInt currentDuration = 0.obs;
  final RxBool isRunning = false.obs;
  final RxInt timer = 0.obs;
  final Rx<TimeOfDay> selectedTime =
      const TimeOfDay(hour: 0, minute: 25).obs; // Default to 25 minutes

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    futurize(initController);
  }

  @override
  Future<bool> initController() async {
    reset(); // Initialize timer and currentDuration
    return true;
  }

  void reset() {
    timer.value =
        selectedTime.value.hour * 3600 + selectedTime.value.minute * 60;
    currentDuration.value = timer.value;
    isRunning.value = false;
    _timer?.cancel();
  }

  void setFocus(bool focus) => isFocus.value = focus;

  void toggleTimer() {
    if (currentDuration.value > 0) {
      isRunning.toggle();
      if (isRunning.value) {
        _startTimer();
      } else {
        _timer?.cancel();
      }
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (currentDuration > 0) {
        currentDuration--;
      } else {
        _timer?.cancel();
        isRunning.value = false;
        if (timer.value > 0) {
          addStudy();
        }
        reset();
      }
    });
  }

  Future<void> addStudy() async {
    if (timer.value > currentDuration.value) {
      // Only add study if some time has passed
      final minutesStudied = (timer.value - currentDuration.value) ~/ 60;
      final success = await _repository.addStudy(AddStudyDto(
        minutesStudied: minutesStudied.toString(),
        studyDate: DateTime.now().toIso8601String(),
      ));

      Get.snackbar(
        success ? 'Success' : 'Error',
        success ? 'Study added successfully' : 'Study could not be added',
      );
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  String formatDuration(int duration) {
    final minutes = duration ~/ 60;
    final seconds = duration % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  String getFinishTime() {
    final now = DateTime.now();
    final finishTime = now.add(Duration(seconds: currentDuration.value));
    return '${finishTime.hour.toString().padLeft(2, '0')}:${finishTime.minute.toString().padLeft(2, '0')}';
  }

  void setTime(TimeOfDay time) {
    selectedTime.value = time;
    reset();
  }

  Future<void> selectWorkTime(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    if (pickedTime != null && pickedTime != selectedTime.value) {
      setTime(pickedTime);
    }
  }
}
