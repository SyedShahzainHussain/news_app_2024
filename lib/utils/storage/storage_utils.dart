import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageUtils {
   FlutterSecureStorage flutterSecureStorage =
      const FlutterSecureStorage();
  static StorageUtils? storageUtils;
  StorageUtils._interval();

  factory StorageUtils() {
    storageUtils ??= StorageUtils._interval();
    return storageUtils!;
  }

   Future<bool> setValue(String key, String value) async {
    await flutterSecureStorage.write(key: key, value: value);
    return true;
  }

   Future<dynamic> readValue(String key) async {
    return await flutterSecureStorage.read(key: key);
  }

   Future<bool> clearValue(String key) async {
    await flutterSecureStorage.delete(key: key);
    return true;
  }
}
