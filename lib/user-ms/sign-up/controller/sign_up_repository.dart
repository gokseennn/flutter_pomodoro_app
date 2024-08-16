import 'package:get/get.dart';
import 'package:pomodoro_app/common/services/api_service/api_service.dart';
import 'package:pomodoro_app/common/services/api_service/model/http_method_enum.dart';
import 'package:pomodoro_app/user-ms/sign-up/model/sign_in_dto.dart';
import 'package:pomodoro_app/common/util.dart';

class SignUpRepository {
  final _apiService = Get.find<ApiService>();
  Future<bool> signIn(SignInDto dto) => _apiService
          .request(
              showError: true,
              showLoader: true,
              path: "http://localhost:5111/Account/register",
              method: HttpMethod.post,
              data: dto.toJson())
          .then((response) {
        return response?.isOk ?? false;
      });
}
