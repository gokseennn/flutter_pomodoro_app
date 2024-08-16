import 'package:get/get.dart';
import 'package:pomodoro_app/user-ms/sign-up/controller/sign_up_controller.dart';
import 'package:pomodoro_app/user-ms/sign-up/controller/sign_up_repository.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
    Get.lazyPut<SignUpRepository>(() => SignUpRepository());
  }
}
