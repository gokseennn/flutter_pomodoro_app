import 'package:get/get.dart';
import 'package:pomodoro_app/general-ms/sign-up/controller/sign_up_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}
