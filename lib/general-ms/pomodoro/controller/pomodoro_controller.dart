import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/common/controller/base_controller.dart';
import 'package:pomodoro_app/general-ms/pomodoro/controller/pomodoro_repository.dart';
import 'package:pomodoro_app/general-ms/pomodoro/model/add_study_dto.dart';

class PomodoroController extends BaseController {
  final _repository = Get.find<PomodoroRepository>();
  var isFocus = true.obs;

  late Timer _timer;
  var currentDuration = 0.obs;
  var isRunning = false.obs;

  final int sessionCount = 3;
  final int totalSessions = 4;

  var timer = 2.obs;

  var selectedTime = const TimeOfDay(hour: 0, minute: 0).obs;

  @override
  void onInit() async {
    futurize(() => initController());
    super.onInit();
  }

  void reset() {
    timer.value = 10;
  }

  @override
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

  void _startTimer() async {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (currentDuration > 0) {
        currentDuration.value--;
      } else {
        _timer.cancel();
        isRunning.value = false;
        await addStudy();
        reset();
      }
    });
  }

  Future<void> addStudy() async {
    final response = await _repository.addStudy(AddStudyDto(
        minutesStudied: timer.value.toString(),
        studyDate: DateTime.now().toIso8601String()));
    if (response) {
      Get.snackbar('Success', 'Study added successfully');
    } else {
      Get.snackbar('Error', 'Study could not be added');
    }
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

  void setTime(TimeOfDay time) {
    selectedTime.value = time;
    timer.value = time.hour * 3600 + time.minute * 60;
  }

  void selectedWorkTime(BuildContext context) async {
    var pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: true, // 24 saat formatı
          ),
          child: child!,
        );
      },
    );
    if (pickedTime != null && pickedTime != selectedTime.value) {
      setTime(pickedTime);
    }
  }
}
