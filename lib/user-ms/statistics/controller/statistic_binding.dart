import 'package:get/get.dart';
import 'package:pomodoro_app/user-ms/statistics/controller/statistic_controller.dart';
import 'package:pomodoro_app/user-ms/statistics/controller/statistic_repository.dart';

class StatisticBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatisticController>(() => StatisticController());
    Get.lazyPut<StatisticRepository>(() => StatisticRepository());
  }
}
