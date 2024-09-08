import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/common/common_screen.dart';
import 'package:pomodoro_app/user-ms/statistics/controller/statistic_controller.dart';
import 'package:pomodoro_app/user-ms/statistics/model/chart_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({super.key});
  static const String routeName = '/statistic';
  @override
  Widget build(BuildContext context) {
    return CommonScreen<StatisticController>(
        showIcon: true,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        body: (controller) {
          return [
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Mesaj
                  SizedBox(height: 20),
                  Text(
                    'We are launching soon!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Stay tuned for updates',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),

                  // Sosyal Medya İkonları
                  SizedBox(height: 30),
                ],
              ),
            ),
          ];
        });
  }

  Widget _buildEventItem(String title, String datetime) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.event, color: Colors.blue[300]),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                datetime,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
