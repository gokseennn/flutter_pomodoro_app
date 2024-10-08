import 'dart:convert';

import 'package:get/get.dart';
import 'package:pomodoro_app/common/services/auth_service/auth_service_repository.dart';
import 'package:pomodoro_app/common/services/auth_service/model/login_request_dto.dart';
import 'package:pomodoro_app/common/services/auth_service/model/user.dart';
import 'package:pomodoro_app/common/services/storage_service/storage_service.dart';
import 'package:pomodoro_app/user-ms/sign-in/view/sign_in_screen.dart';

class AuthService extends GetxService {
  final _storageService = Get.find<StorageService>();
  final _repository = Get.put(AuthServiceRepository());

  final _user = Rx<User?>(null);
  User? get user => _user.value;
  set user(User? user) => _user.value = user;
  Stream<User?> get userChanges => _user.stream;

  void init() async {
    var userJson = await _storageService.read("user");
    if (userJson != null) {
      user = User.fromJson(jsonDecode(userJson));
    } else {
      user = null;
    }
    super.onInit();
  }

  Future<User?> login(String email, String password) async {
    var request = LoginRequestDto(password: password, email: email);
    var response = await _repository.login(request);
    if (response != null) {
      _user.value = response;
      _storageService.write("user", jsonEncode(response.toJson()));
    }
    return response;
  }

  Future<void> logout() async {
    _user.value = null;
    await _storageService.delete("user");
    Get.toNamed(SignInScreen.routeName);
  }
}
