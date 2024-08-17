import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/common/components/api_loading.dart';
import 'package:pomodoro_app/common/services/api_service/api_service.dart';
import 'package:pomodoro_app/common/services/api_service/model/api_provider_enum.dart';
import 'package:pomodoro_app/common/services/auth_service/auth_service.dart';
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
          AlertDialog(
            title: Text(error.message.toString()),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back(); // Dialogu kapatmak için
                },
                child: const Text('OK'),
              ),
            ],
          ),
          barrierDismissible:
              false, // Kullanıcıya dokunarak dialogu kapatmayı engelle
        );
      },
    ),
    permanent: true,
  );
  Get.put(AuthService(), permanent: true);
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
