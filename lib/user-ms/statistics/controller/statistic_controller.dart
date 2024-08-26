import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pomodoro_app/common/controller/base_controller.dart';
import 'package:pomodoro_app/user-ms/statistics/controller/statistic_repository.dart';
import 'package:pomodoro_app/user-ms/statistics/model/chart_data.dart';
import 'package:pomodoro_app/user-ms/statistics/model/day_statistics_model.dart';

class StatisticController extends BaseController {
  final _repository = Get.find<StatisticRepository>();
  final Rx<List<ChartData>> data = Rx<List<ChartData>>([]);
  final List<DayStatistics> statisticsList = [];
  @override
  Future<void> initController() async {
    await getDayStatistics();

    return super.initController();
  }

  Future<void> getDayStatistics() async {
    var response = await _repository.getStatistics();
    if (response.isNotEmpty) {
      statisticsList.addAll(response);
    }
    data.value = statisticsList
        .map(
          (e) => ChartData(DateFormat('dd/MM').format(e.studyDate),
              e.minutesStudied.toDouble(), _getColorForDay(e.studyDate)),
        )
        .toList();
    processStatistics();
  }

  void processStatistics() {}

  Color _getColorForDay(DateTime date) {
    int daysAgo = DateTime.now().difference(date).inDays;
    switch (daysAgo) {
      case 0:
        return Colors.black;
      case 1:
        return Colors.grey[600]!;
      case 2:
        return Colors.grey[500]!;
      case 3:
        return Colors.grey[400]!;
      case 4:
        return Colors.grey[300]!;
      case 5:
        return Colors.grey[400]!;
      case 6:
        return Colors.grey[500]!;
      default:
        return Colors.grey;
    }
  }
}
