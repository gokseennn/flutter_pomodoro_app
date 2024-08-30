import '../i_environment_config.dart';

class DevelopmentConfig extends IEnvrionmentConfig {
  @override
  String get apiHost => "http://localhost:8080";
  @override
  String get host => "http://localhost:8080";
}
