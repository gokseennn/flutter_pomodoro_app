import 'package:get/get.dart';
import 'package:pomodoro_app/common/services/storage_service/provider/shared_preferences_storage_provider.dart';
import 'package:pomodoro_app/common/services/storage_service/provider/storage_service_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  late final IStorageProvider _provider;

  Future<StorageService> init() async {
    final prefs = await SharedPreferences.getInstance();
    _provider = SharedPreferencesStorageProvider(prefs);
    return this;
  }

  Future<void> write(String key, String value) async {
    await _provider.write(key, value);
  }

  Future<String?> read(String key) async {
    return await _provider.read(key);
  }

  Future<void> delete(String key) async {
    await _provider.delete(key);
  }

  Future<void> clear() async {
    await _provider.clear();
  }
}
