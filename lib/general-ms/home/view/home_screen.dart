import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pomodoro_app/common/common_screen.dart';
import 'package:pomodoro_app/general-ms/home/controller/home_controller.dart';
import 'package:pomodoro_app/general-ms/home/model/task.dart';
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
                  _buildSectionTitle('YOUR HABITS'),
                  const SizedBox(height: 16),
                  _buildHabitsList(controller),
                  const SizedBox(height: 40),
                  _buildSectionTitle('Your tasks'),
                  const SizedBox(height: 16),
                  _buildAddTaskButton(controller),
                  const SizedBox(height: 16),
                  _buildTasksList(controller),
                  const SizedBox(height: 40),
                  _buildSectionTitle('Completed Tasks'),
                  const SizedBox(height: 16),
                  _buildCompletedTasksList(controller),
                ],
              ),
            ),
          ),
        ),
      ];
    });
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
        letterSpacing: 0.5,
      ),
    );
  }

  Widget _buildHabitsList(HomeController controller) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 16),
          child: _buildHabitCircle(index, controller),
        ),
      ),
    );
  }

  Widget _buildHabitCircle(int index, HomeController controller) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey[500]!, width: 3),
          ),
          child: index == 0
              ? Icon(Icons.add, color: Colors.grey[500], size: 30)
              : null,
        ),
        if (index == 0)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              'ADD/EDIT\nHABIT',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 10,
                height: 1.2,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildAddTaskButton(HomeController controller) {
    return InkWell(
      onTap: () {
        Get.dialog(AddTask(controller: controller));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[400]!),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add, color: Colors.grey[400], size: 20),
            const SizedBox(width: 8),
            Text(
              'ADD A TASK',
              style: TextStyle(color: Colors.grey[500], fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTasksList(HomeController controller) {
    return Obx(
      () => ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.taskList.value.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          return _buildTaskItem(controller.taskList.value[index], controller);
        },
      ),
    );
  }

  Widget _buildCompletedTasksList(HomeController controller) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.complatedTaskList.value.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        return _buildTaskItem(
            controller.complatedTaskList.value[index], controller,
            isCompleted: true);
      },
    );
  }

  Widget _buildTaskItem(Task task, HomeController controller,
      {bool isCompleted = false}) {
    return Dismissible(
      key: Key(task.id.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) async {
        await controller.deleteTask(task);
      },
      background: Container(
        color: Colors.red[400],
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        leading: GestureDetector(
          onTap: () => controller.toogleTaskStatus(task),
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey, width: 2),
            ),
            child: isCompleted
                ? Icon(Icons.check, color: Colors.grey[600], size: 18)
                : null,
          ),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            decoration: isCompleted ? TextDecoration.lineThrough : null,
            color: isCompleted ? Colors.grey : Colors.black87,
          ),
        ),
        subtitle: Text(
          DateFormat('EEE, MMM d, yyyy - h:mm a')
              .format(DateTime.parse(task.dueDate)),
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
