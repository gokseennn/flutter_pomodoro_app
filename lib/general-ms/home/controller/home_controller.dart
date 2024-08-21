import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/common/controller/base_controller.dart';
import 'package:pomodoro_app/general-ms/home/controller/home_repository.dart';
import 'package:pomodoro_app/general-ms/home/model/add_task_dto.dart';
import 'package:pomodoro_app/general-ms/home/model/task.dart';

class HomeController extends BaseController {
  final _repository = Get.find<HomeRepository>();
  final Rx<List<Task>> taskList =
      Rx<List<Task>>([]); // Başlangıçta boş bir liste
  final TextEditingController taskTextEditingController =
      TextEditingController();

  final Rx<DateTime> selectedDateTime = DateTime.now().obs;

  @override
  Future<void> initController() async {
    var tasks = await _repository.getAlltask();
    if (tasks.isNotEmpty) {
      taskList.value =
          tasks.where((task) => task != null).cast<Task>().toList();
    } else {
      taskList.value = [];
    }
  }

  void updateDateTime(DateTime newDateTime) {
    selectedDateTime.value = newDateTime;
  }

  Future<void> selectDateTime(BuildContext context) async {
    final dateTime = await showDateTimePicker(
      context: context,
      initialDateTime: selectedDateTime.value,
    );
    if (dateTime != null) {
      updateDateTime(dateTime);
    }
  }

  Future<DateTime?> showDateTimePicker({
    required BuildContext context,
    DateTime? initialDateTime,
  }) {
    return showDatePicker(
      context: context,
      initialDate: initialDateTime ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    ).then((date) {
      if (date != null) {
        return showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(date),
        ).then((time) {
          if (time != null) {
            return DateTime(
              date.year,
              date.month,
              date.day,
              time.hour,
              time.minute,
            );
          }
          return null;
        });
      }
      return null;
    });
  }

  void addNewHabit() async {
    var response = await _repository.addTask(AddTaskDto(
      title: taskTextEditingController.text,
      datetime: selectedDateTime.value,
    ));
    print(response == true ? "Task added successfully" : "Task failed to add");
  }
}
