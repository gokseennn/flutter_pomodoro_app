import 'package:flutter/material.dart';
import 'package:pomodoro_app/common/common_screen.dart';
import 'package:pomodoro_app/user-ms/statistics/controller/statistic_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({super.key});
  static const String routeName = '/statistic';
  @override
  Widget build(BuildContext context) {
    final List<_ChartData> data = [
      _ChartData('M', 80, Colors.black),
      _ChartData('T', 60, Colors.grey[600]!),
      _ChartData('W', 40, Colors.grey[500]!),
      _ChartData('T', 70, Colors.grey[400]!),
      _ChartData('F', 90, Colors.grey[300]!),
      _ChartData('S', 50, Colors.grey[400]!),
      _ChartData('S', 30, Colors.grey[500]!),
    ];

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
                    SfCartesianChart(
                      primaryXAxis: const CategoryAxis(
                        majorGridLines: MajorGridLines(width: 0),
                      ),
                      primaryYAxis: NumericAxis(
                        minimum: 0,
                        maximum: 100,
                        interval: 10,

                        majorGridLines: const MajorGridLines(width: 0),
                        labelFormat:
                            '{value}h', // Y eksenine saat formatında etiketler ekler.
                        labelStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[700],
                        ),
                      ),
                      series: <CartesianSeries<dynamic, String>>[
                        ColumnSeries<_ChartData, String>(
                          dataSource: data,
                          xValueMapper: (_ChartData data, _) => data.day,
                          yValueMapper: (_ChartData data, _) => data.value,
                          pointColorMapper: (_ChartData data, _) => data.color,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          width: 0.5,
                          spacing: 0.2,
                        )
                      ],
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

class _ChartData {
  _ChartData(this.day, this.value, this.color);
  final String day;
  final double value;
  final Color color;
}
