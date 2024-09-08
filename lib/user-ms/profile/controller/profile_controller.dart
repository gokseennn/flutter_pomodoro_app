import 'package:get/get.dart';
import 'package:pomodoro_app/common/controller/base_controller.dart';
import 'package:pomodoro_app/common/services/auth_service/auth_service.dart';
import 'package:pomodoro_app/common/services/auth_service/model/user.dart';

class ProfileController extends BaseController {
  final _authService = Get.find<AuthService>();
  final User user = Get.find<AuthService>().user!;
  void logOut() async {
    await _authService.logout();
  }
}
