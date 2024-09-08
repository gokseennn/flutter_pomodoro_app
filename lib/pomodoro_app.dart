import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/common/services/auth_service/auth_service.dart';
import 'package:pomodoro_app/general-ms/general_routes.dart';
import 'package:pomodoro_app/general-ms/home/controller/home_binding.dart';
import 'package:pomodoro_app/general-ms/home/view/home_screen.dart';
import 'package:pomodoro_app/general-ms/welcome/controller/welcome_binding.dart';
import 'package:pomodoro_app/general-ms/welcome/view/welcome_screen.dart';
import 'package:pomodoro_app/user-ms/user_routes.dart';

class PomodoroApp extends StatelessWidget {
  PomodoroApp({super.key});
  final AuthService _authService = Get.find<AuthService>();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        defaultTransition: Transition.noTransition,
        initialBinding:
            _authService.user == null ? WelcomeBinding() : HomeBinding(),
        initialRoute: _authService.user == null
            ? WelcomeScreen.routeName
            : HomeScreen.routeName,
        getPages: GeneralRoutes.routes + UserRoutes.routes);
  }
}
