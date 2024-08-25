import 'package:get/get.dart';
import 'package:pomodoro_app/common/services/api_service/api_service.dart';
import 'package:pomodoro_app/common/services/api_service/model/http_method_enum.dart';
import 'package:pomodoro_app/general-ms/pomodoro/model/add_study_dto.dart';
import 'package:pomodoro_app/common/util.dart';

class PomodoroRepository {
  final _apiService = Get.find<ApiService>();
  Future<bool> addStudy(AddStudyDto addStudyDto) async {
    final response = await _apiService.request(
      path: "http://localhost:5111/Study/addStudy",
      method: HttpMethod.post,
      data: addStudyDto.toJson(),
    );

    if (response?.isOk ?? false) {
      return true;
    }
    return false;
  }
}
