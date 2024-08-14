import 'package:get/get.dart';
import 'package:pomodoro_app/general-ms/welcome/controller/welcome_controller.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(() => WelcomeController());
  }
}
