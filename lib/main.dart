import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/common/components/api_loading.dart';
import 'package:pomodoro_app/common/services/api_service/api_service.dart';
import 'package:pomodoro_app/common/services/api_service/model/api_provider_enum.dart';
import 'package:pomodoro_app/general-ms/general_routes.dart';
import 'package:pomodoro_app/general-ms/welcome/controller/welcome_binding.dart';
import 'package:pomodoro_app/general-ms/welcome/view/welcome_screen.dart';
import 'package:pomodoro_app/user-ms/user_routes.dart';

void main() {
  Get.put(
    ApiService(
      provider: ApiProvider.dio,
      baseUrl: '',
      timeout: 5.seconds,
      loader: const ApiLoading(),
      onError: (error) {
        Get.dialog(
          Text(error.toString()),
        );
      },
    ),
    permanent: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: WelcomeBinding(),
        initialRoute: WelcomeScreen.routeName,
        getPages: GeneralRoutes.routes + UserRoutes.routes);
  }
}
