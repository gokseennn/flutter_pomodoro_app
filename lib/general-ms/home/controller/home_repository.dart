import 'package:get/get.dart';
import 'package:pomodoro_app/common/environment/environment.dart';
import 'package:pomodoro_app/common/services/api_service/api_service.dart';
import 'package:pomodoro_app/common/services/api_service/model/http_method_enum.dart';
import 'package:pomodoro_app/common/util.dart';
import 'package:pomodoro_app/general-ms/home/model/add_task_dto.dart';
import 'package:pomodoro_app/general-ms/home/model/task.dart';
import 'package:pomodoro_app/general-ms/home/model/upgrade_task_dto.dart';

class HomeRepository {
  final _apiService = Get.find<ApiService>();
  Future<bool> addTask(AddTaskDto task) => _apiService
          .request(
              showError: true,
              showLoader: true,
              path: Environment.config.kTaskUrl,
              method: HttpMethod.post,
              data: task.toJson())
          .then((response) {
        return response?.isOk ?? false;
      });
  Future<List<Task>> getAlltask() => _apiService
          .request(path: Environment.config.kTaskUrl, method: HttpMethod.get)
          .then((response) {
        if (response?.isOk ?? false) {
          final data = response?.data;
          if (data["data"] is List) {
            final taskList =
                (data["data"] as List).map((e) => Task.fromJson(e)).toList();
            return taskList;
          } else {
            return [];
          }
        }
        return [];
      });
  Future<bool> toggleTaskStatus(UpgradeTaskDto task) => _apiService
          .request(
        path: Environment.config.kTaskUrl,
        method: HttpMethod.put,
        data: task.toJson(),
        showError: true,
        showLoader: true,
      )
          .then((response) {
        return response?.isOk ?? false;
      });
  Future<bool> deleteTask(int id) => _apiService
          .request(
              path: "${Environment.config.kTaskUrl}/$id",
              method: HttpMethod.delete,
              showError: true,
              showLoader: true)
          .then((response) {
        return response?.isOk ?? false;
      });
}
