import '../i_environment_config.dart';

class DevelopmentConfig extends IEnvrionmentConfig {
  @override
  String get apiHost => "http://128.0.1.233:8080";
  @override
  String get host => "http://128.0.1.233:8080";
}
