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
        body: (controller) {
          return [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const Icon(Icons.arrow_back),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.arrow_back_ios,
                                size: 14,
                              ),
                            ),
                            const Text(
                              'This week',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Icon(Icons.calendar_month)
                      ],
                    ),
                    Text("Daily avarage 4h23m",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold)),
                    Obx(
                      () => SfCartesianChart(
                        primaryXAxis: const CategoryAxis(
                          majorGridLines: MajorGridLines(width: 0),
                        ),
                        primaryYAxis: NumericAxis(
                          minimum: 0,
                          interval: 10,

                          majorGridLines: const MajorGridLines(width: 0),
                          labelFormat:
                              '{value}M', // Y eksenine saat formatında etiketler ekler.
                          labelStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[700],
                          ),
                        ),
                        series: <CartesianSeries<dynamic, String>>[
                          ColumnSeries<ChartData, String>(
                            dataSource: controller.data.value,
                            xValueMapper: (ChartData data, _) => data.day,
                            yValueMapper: (ChartData data, _) => data.value,
                            pointColorMapper: (ChartData data, _) => data.color,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            width: 0.5,
                            spacing: 0.2,
                          )
                        ],
                      ),
                    ),
                    _buildEventItem('Lunch with Client', 'Friday, 12:30 PM'),
                    _buildEventItem('Lunch with Client', 'Friday, 12:30 PM'),
                    _buildEventItem('Lunch with Client', 'Friday, 12:30 PM'),
                    _buildEventItem('Lunch with Client', 'Friday, 12:30 PM'),
                    _buildEventItem('Lunch with Client', 'Friday, 12:30 PM'),
                    _buildEventItem('Lunch with Client', 'Friday, 12:30 PM'),
                    _buildEventItem('Lunch with Client', 'Friday, 12:30 PM'),
                    _buildEventItem('Lunch with Client', 'Friday, 12:30 PM'),
                    _buildEventItem('Lunch with Client', 'Friday, 12:30 PM'),
                  ],
                ),
              ),
            )
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
