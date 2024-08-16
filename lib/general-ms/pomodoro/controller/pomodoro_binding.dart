import 'package:get/get.dart';
import 'package:pomodoro_app/general-ms/pomodoro/controller/pomodoro_controller.dart';

class PomodoroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PomodoroController>(() => PomodoroController());
  }
}
