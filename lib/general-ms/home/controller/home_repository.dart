import 'package:get/get.dart';
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
              path: "http://localhost:5111/api/Task",
              method: HttpMethod.post,
              data: task.toJson())
          .then((response) {
        return response?.isOk ?? false;
      });

  Future<List<Task?>> getAlltask() => _apiService
          .request(
              path: "http://localhost:5111/api/Task", method: HttpMethod.get)
          .then((response) {
        if (response?.isOk ?? false) {
          try {
            // 'data' anahtarını kontrol ederek listeyi alıyoruz
            var data = response!.data as List<dynamic>;
            return data.map((json) {
              // Her bir elemanı Task modeline dönüştürüyoruz
              if (json is Map<String, dynamic>) {
                return Task.fromJson(json);
              } else {
                return null;
              }
            }).toList();
          } catch (e) {
            return [];
          }
        }
        return [];
      });
  Future<bool> toggleTaskStatus(UpgradeTaskDto task) => _apiService
          .request(
        path: "http://localhost:5111/api/Task",
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
              path: "http://localhost:5111/api/Task/$id",
              method: HttpMethod.delete,
              showError: true,
              showLoader: true)
          .then((response) {
        return response?.isOk ?? false;
      });
}
