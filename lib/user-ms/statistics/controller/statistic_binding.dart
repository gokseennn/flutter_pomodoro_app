import 'package:get/get.dart';
import 'package:pomodoro_app/user-ms/statistics/controller/statistic_controller.dart';

class StatisticBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatisticController>(() => StatisticController());
  }
}
