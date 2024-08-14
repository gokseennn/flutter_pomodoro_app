import 'package:get/get.dart';
import 'package:pomodoro_app/user-ms/sign-in/controller/sign_in_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }
}
