import 'package:flutter/material.dart';
import 'package:pomodoro_app/common/controller/base_controller.dart';
import 'package:pomodoro_app/user-ms/statistics/model/chart_data.dart';

class StatisticController extends BaseController {
  final List<ChartData> data = [
    ChartData('M', 80, Colors.black),
    ChartData('T', 60, Colors.grey[600]!),
    ChartData('W', 200, Colors.grey[500]!),
    ChartData('T', 70, Colors.grey[400]!),
    ChartData('F', 90, Colors.grey[300]!),
    ChartData('S', 50, Colors.grey[400]!),
    ChartData('S', 150, Colors.grey[500]!),
  ];
}
