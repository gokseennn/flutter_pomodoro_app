import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pomodoro_app/user-ms/profile/controller/sign_in_binding.dart';
import 'package:pomodoro_app/user-ms/profile/view/profile_screen.dart';
import 'package:pomodoro_app/user-ms/statistics/controller/statistic_binding.dart';
import 'package:pomodoro_app/user-ms/statistics/view/statistic_screen.dart';

class UserRoutes {
  static final routes = [
    GetPage(
      name: ProfileScreen.routeName,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
        name: StatisticScreen.routeName,
        page: () => const StatisticScreen(),
        binding: StatisticBinding()),
  ];
}
