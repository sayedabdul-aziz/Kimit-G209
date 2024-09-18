import 'package:hive/hive.dart';

class AppLocalStorage {
  static late Box userBox;

  static init() {
    userBox = Hive.box('userBox');
  }

  static cacheData(String key, dynamic value) {
    userBox.put(key, value);
  }

  static getCachedData(String key) {
    return userBox.get(key);
  }
}
