import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pomodoro_app/general-ms/home/controller/home_binding.dart';
import 'package:pomodoro_app/general-ms/home/view/home_screen.dart';
import 'package:pomodoro_app/general-ms/settings/controller/setting_bindings.dart';
import 'package:pomodoro_app/general-ms/settings/view/settings_screen.dart';
import 'package:pomodoro_app/general-ms/splash/view/splas_screen.dart';

class GeneralRoutes {
  static final routes = [
    GetPage(
      name: SplashScreen.routeName,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: HomeScreen.routeName,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: SettingsScreen.routeName,
        page: () => const SettingsScreen(),
        binding: SettingBindings()),
  ];
}
