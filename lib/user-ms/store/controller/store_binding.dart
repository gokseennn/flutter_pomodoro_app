import 'package:get/get.dart';
import 'package:pomodoro_app/user-ms/store/controller/store_controller.dart';

class StoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreController>(() => StoreController());
  }
}
