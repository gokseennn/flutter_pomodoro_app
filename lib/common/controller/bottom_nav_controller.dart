import 'package:get/get.dart';
import 'package:pomodoro_app/general-ms/home/view/home_screen.dart';
import 'package:pomodoro_app/general-ms/pomodoro/view/pomodoro_screen.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTabIndex(int index) {
    selectedIndex.value = index;
    switch (index) {
      case 0:
        Get.offAllNamed(PomodoroScreen.routeName);
        break;
      case 1:
        Get.offAllNamed(HomeScreen.routeName);
        break;
      case 2:
        Get.offAllNamed('/sign-up');
        break;
    }
  }
}
