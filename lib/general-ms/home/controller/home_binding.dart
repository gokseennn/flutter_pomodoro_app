import 'package:get/get.dart';
import 'package:pomodoro_app/general-ms/home/controller/home_controller.dart';
import 'package:pomodoro_app/general-ms/home/controller/home_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<HomeRepository>(() => HomeRepository());
  }
}
