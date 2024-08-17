abstract class IStorageProvider {
  Future<void> clear();
  Future<void> delete(String key);
  Future<String?> read(String key);
  Future<void> write(String key, String value);
}
