abstract class IEnvrionmentConfig {
  String get apiHost;
  String get host;
  String get kAccountUrl => '$apiHost/Account';
  String get kStudyUrl => '$apiHost/Study';
  String get kTaskUrl => '$apiHost/api/Task';
}
