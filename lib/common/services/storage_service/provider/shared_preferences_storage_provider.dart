import 'package:pomodoro_app/common/services/storage_service/provider/storage_service_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesStorageProvider implements IStorageProvider {
  final SharedPreferences _storage;

  SharedPreferencesStorageProvider(this._storage);

  @override
  Future<void> clear() {
    return _storage.clear();
  }

  @override
  Future<void> delete(String key) {
    return _storage.remove(key);
  }

  @override
  Future<String?> read(String key) {
    return Future.value(_storage.getString(key));
  }

  @override
  Future<void> write(String key, String value) {
    return _storage.setString(key, value);
  }
}
