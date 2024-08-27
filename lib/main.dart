import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/common/components/api_loading.dart';
import 'package:pomodoro_app/common/environment/environment.dart';
import 'package:pomodoro_app/common/services/api_service/api_service.dart';
import 'package:pomodoro_app/common/services/api_service/model/api_provider_enum.dart';
import 'package:pomodoro_app/common/services/auth_service/auth_service.dart';
import 'package:pomodoro_app/common/services/storage_service/storage_service.dart';
import 'package:pomodoro_app/general-ms/general_routes.dart';
import 'package:pomodoro_app/general-ms/home/controller/home_binding.dart';
import 'package:pomodoro_app/general-ms/home/view/home_screen.dart';
import 'package:pomodoro_app/general-ms/welcome/controller/welcome_binding.dart';
import 'package:pomodoro_app/general-ms/welcome/view/welcome_screen.dart';
import 'package:pomodoro_app/user-ms/user_routes.dart';

void main() async {
  Environment.initConfig();
  WidgetsFlutterBinding.ensureInitialized();
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

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AuthService _authService = Get.find<AuthService>();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        defaultTransition: Transition.noTransition,
        initialBinding:
            _authService.user == null ? WelcomeBinding() : HomeBinding(),
        initialRoute: _authService.user == null
            ? WelcomeScreen.routeName
            : HomeScreen.routeName,
        getPages: GeneralRoutes.routes + UserRoutes.routes);
  }
}
