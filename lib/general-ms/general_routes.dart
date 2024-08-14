import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pomodoro_app/general-ms/home/controller/home_binding.dart';
import 'package:pomodoro_app/general-ms/home/view/home_screen.dart';
import 'package:pomodoro_app/general-ms/sign-up/controller/sign_up_binding.dart';
import 'package:pomodoro_app/general-ms/sign-up/view/sign_up_screen.dart';
import 'package:pomodoro_app/general-ms/welcome/controller/welcome_binding.dart';
import 'package:pomodoro_app/general-ms/welcome/view/welcome_screen.dart';

class GeneralRoutes {
  static final routes = [
    GetPage(
      name: HomeScreen.routeName,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: WelcomeScreen.routeName,
        page: () => const WelcomeScreen(),
        binding: WelcomeBinding()),
    GetPage(
        name: SignUpScreen.routeName,
        page: () => const SignUpScreen(),
        binding: SignUpBinding())
  ];
}
