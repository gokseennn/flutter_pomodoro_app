import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/common/common_screen.dart';
import 'package:pomodoro_app/general-ms/home/controller/home_controller.dart';
import 'package:pomodoro_app/general-ms/home/view/components/add_task.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return CommonScreen<HomeController>(body: (controller) {
      return [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'YOUR HABITS:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  SizedBox(
                    height: 100, // Set a fixed height for the horizontal list
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Colors.grey[500]!, width: 4),
                          ),
                          child: index == 0
                              ? Icon(Icons.add,
                                  color: Colors.grey[500], size: 30)
                              : null,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: controller.addNewHabit,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        children: [
                          Text(
                            'ADD/EDIT',
                            style: TextStyle(
                                color: Colors.grey[500], fontSize: 12),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'HABIT',
                            style: TextStyle(
                                color: Colors.grey[500], fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Your tasks',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      Get.dialog(AddTask(
                        controller: controller,
                      ));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add, color: Colors.grey[400]),
                        const SizedBox(width: 8),
                        Text(
                          'ADD A TASK',
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  _buildEventItem('Lunch with Client', 'Friday, 12:30 PM'),
                  _buildEventItem('Lunch with Client', 'Friday, 12:30 PM'),
                  _buildEventItem('Lunch with Client', 'Friday, 12:30 PM'),
                  _buildEventItem('Lunch with Client', 'Friday, 12:30 PM'),

                  const SizedBox(height: 40),
                  const Text(
                    'Upcoming this week',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.add, color: Colors.grey[400]),
                      const SizedBox(width: 8),
                      Text(
                        'ADD AN EVENT',
                        style: TextStyle(color: Colors.grey[500], fontSize: 14),
                      ),
                    ],
                  ),
                  // Simulated events for demonstration
                  const SizedBox(height: 16),
                  _buildEventItem('Team Meeting', 'Monday, 10:00 AM'),
                  _buildEventItem('Project Deadline', 'Wednesday, 5:00 PM'),
                  _buildEventItem('Lunch with Client', 'Friday, 12:30 PM'),
                  _buildEventItem('Lunch with Client', 'Friday, 12:30 PM'),
                  _buildEventItem('Lunch with Client', 'Friday, 12:30 PM'),
                ],
              ),
            ),
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
