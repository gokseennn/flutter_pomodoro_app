import 'package:get/get.dart';
import 'package:pomodoro_app/general-ms/home/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
