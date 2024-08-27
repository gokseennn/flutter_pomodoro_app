import 'package:get/get_core/src/get_main.dart';

import 'environment_configs/development_config.dart';
import 'environment_configs/production_config.dart';
import 'i_environment_config.dart';

class Environment {
  static late final IEnvrionmentConfig config;

  static void initConfig() {
    const hasEnvriorment = bool.hasEnvironment('environment');
    if (!hasEnvriorment) {
      throw Exception(
        'Environment veriable not found, please add it to your run configuration. (--dart-define=environment=development-staging-production)',
      );
    } else {
      const environment = String.fromEnvironment('environment');
      config = _getConfig(environment);
      Get.log('Environment: \'$environment\' is initialized.');
    }
  }

  static IEnvrionmentConfig _getConfig(String environment) {
    switch (environment) {
      case 'development':
        return DevelopmentConfig();
      case 'production':
        return ProductionConfig();
      default:
        throw Exception('Environment not found with name \'$environment\'');
    }
  }
}
