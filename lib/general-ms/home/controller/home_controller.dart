import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/common/controller/base_controller.dart';
import 'package:pomodoro_app/general-ms/home/controller/home_repository.dart';
import 'package:pomodoro_app/general-ms/home/model/add_task_dto.dart';
import 'package:pomodoro_app/general-ms/home/model/task.dart';
import 'package:pomodoro_app/general-ms/home/model/upgrade_task_dto.dart';

class HomeController extends BaseController {
  final _repository = Get.find<HomeRepository>();
  final Rx<List<Task>> taskList =
      Rx<List<Task>>([]); // Başlangıçta boş bir liste
  final Rx<List<Task>> complatedTaskList = Rx<List<Task>>([]);
  final TextEditingController taskTextEditingController =
      TextEditingController();

  final Rx<DateTime> selectedDateTime = DateTime.now().obs;

  @override
  Future<void> initController() async {
    var tasks = await _repository.getAlltask();
    print("5");
    if (tasks.isNotEmpty) {
      print("3");
      taskList.value =
          tasks.where((task) => task.isComplate == false).cast<Task>().toList();
      taskList.value = taskList.value.reversed.toList();
      complatedTaskList.value =
          tasks.where((task) => task.isComplate == true).cast<Task>().toList();
    } else {
      print("4");
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

  Future<void> addNewHabit() async {
    var response = await _repository.addTask(AddTaskDto(
      title: taskTextEditingController.text,
      datetime: selectedDateTime.value,
    ));
    if (response == true) {
      await initController();
      update();
    }
    Get.back();
  }

  void toogleTaskStatus(Task dto) async {
    var response = await _repository.toggleTaskStatus(
        UpgradeTaskDto(id: dto.id, isComplate: !dto.isComplate));
    if (response == true) {
      await initController();
    }
  }

  Future<void> deleteTask(Task dto) async {
    var response = await _repository.deleteTask(dto.id);
    if (response == true) {
      await initController();
    }
  }
}
