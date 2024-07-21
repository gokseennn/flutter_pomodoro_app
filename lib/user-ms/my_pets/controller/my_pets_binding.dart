import 'package:get/get.dart';
import 'package:pomodoro_app/user-ms/my_pets/controller/my_pets_controller.dart';

class MyPetsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyPetsController>(() => MyPetsController());
  }
}
