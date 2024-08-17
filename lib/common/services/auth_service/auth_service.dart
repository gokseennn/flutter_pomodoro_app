import 'package:get/get.dart';
import 'package:pomodoro_app/common/services/auth_service/auth_service_repository.dart';
import 'package:pomodoro_app/common/services/auth_service/model/login_request_dto.dart';
import 'package:pomodoro_app/common/services/auth_service/model/user.dart';

class AuthService extends GetxService {
  final _repository = Get.put(AuthServiceRepository());
  final _user = Rx<User?>(null);
  User? get user => _user.value;
  set user(User? user) => _user.value = user;

  Future<User?> login(String email, String password) async {
    var request = LoginRequestDto(password: password, email: email);

    var response = await _repository.login(request);
    if (response != null) {
      _user.value = response;
    }
    return user;
  }
}
