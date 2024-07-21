import 'package:get/get.dart';
import 'package:pomodoro_app/general-ms/settings/controller/settings_controller.dart';

class SettingBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
