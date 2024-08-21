import 'package:get/get.dart';
import 'package:pomodoro_app/common/services/api_service/api_service.dart';
import 'package:pomodoro_app/common/services/api_service/model/http_method_enum.dart';
import 'package:pomodoro_app/common/util.dart';
import 'package:pomodoro_app/general-ms/home/model/add_task_dto.dart';

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
}
