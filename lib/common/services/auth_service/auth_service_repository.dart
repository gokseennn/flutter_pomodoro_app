import 'package:get/get.dart';
import 'package:pomodoro_app/common/environment/environment.dart';
import 'package:pomodoro_app/common/services/api_service/api_service.dart';
import 'package:pomodoro_app/common/services/api_service/model/http_method_enum.dart';
import 'package:pomodoro_app/common/services/auth_service/model/login_request_dto.dart';
import 'package:pomodoro_app/common/services/auth_service/model/user.dart';
import 'package:pomodoro_app/common/util.dart';

class AuthServiceRepository {
  final _apiService = Get.find<ApiService>();

  Future<User?> login(
    LoginRequestDto? dto, {
    bool showLoader = true,
    bool showError = true,
  }) =>
      _apiService
          .request(
        method: HttpMethod.post,
        path: "${Environment.config.kAccountUrl}/login",
        data: dto?.toJson(),
        showLoader: showLoader,
        showError: showError,
      )
          .then(
        (response) async {
          if (response?.isOk ?? false) {
            response!.data["data"].addAll({
              'token':
                  response.headers['Authorization']?.map((e) => e).join('; ') ??
                      ''
            });
            return User.fromJson(response.data['data']);
          }
          return null;
        },
      );
}
