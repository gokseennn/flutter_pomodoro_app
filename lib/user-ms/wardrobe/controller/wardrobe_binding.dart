import 'package:get/get.dart';
import 'package:pomodoro_app/user-ms/wardrobe/controller/wardrobe_controller.dart';

class WardrobeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WardrobeController>(() => WardrobeController());
  }
}
