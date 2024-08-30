import '../i_environment_config.dart';

class DevelopmentConfig extends IEnvrionmentConfig {
  @override
  String get apiHost => "localhost:8080";
  @override
  String get host => "localhost:8080";
}
