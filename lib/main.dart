import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/common/components/api_loading.dart';
import 'package:pomodoro_app/common/environment/environment.dart';
import 'package:pomodoro_app/common/services/api_service/api_service.dart';
import 'package:pomodoro_app/common/services/api_service/model/api_provider_enum.dart';
import 'package:pomodoro_app/common/services/auth_service/auth_service.dart';
import 'package:pomodoro_app/common/services/notifications_service/notifications_service.dart';
import 'package:pomodoro_app/common/services/storage_service/storage_service.dart';
import 'package:pomodoro_app/pomodoro_app.dart';

void main() async {
  Environment.initConfig();
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(PomodoroApp());
}

Future<void> initServices() async {
  await Get.putAsync(() async => StorageService().init());
  Get.put(
    ApiService(
      provider: ApiProvider.dio,
      baseUrl: '',
      timeout: 5.seconds,
      loader: const ApiLoading(),
      onError: (error) {
        Get.dialog(
          AlertDialog(
            title: Text(error.message.toString()),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('OK'),
              ),
            ],
          ),
          barrierDismissible: false,
        );
      },
    ),
    permanent: true,
  );
  Get.put(AuthService(), permanent: true).init();
  await Get.putAsync(() => NotificationService().init());
}
