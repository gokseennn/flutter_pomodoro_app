import 'package:get/get.dart';
import 'package:pomodoro_app/general-ms/pomodoro/controller/pomodoro_controller.dart';
import 'package:pomodoro_app/general-ms/pomodoro/controller/pomodoro_repository.dart';

class PomodoroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PomodoroController>(() => PomodoroController());
    Get.lazyPut<PomodoroRepository>(() => PomodoroRepository());
  }
}
