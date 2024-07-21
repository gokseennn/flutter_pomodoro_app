import 'package:get/get.dart';
import 'package:pomodoro_app/general-ms/home/view/home_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 1), () {
      print("object");
      Get.offAllNamed(HomeScreen.routeName);
    });
    super.onInit();
  }
}
