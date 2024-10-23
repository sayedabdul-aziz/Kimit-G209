import 'package:hive/hive.dart';
import 'package:taskati/core/model/task_model.dart';

class AppLocalStorage {
  static late Box userBox;
  static late Box<TaskModel> tasksBox;

  static init() {
    userBox = Hive.box('userBox');
    tasksBox = Hive.box<TaskModel>('tasksBox');
  }

  static cacheData(String key, dynamic value) {
    userBox.put(key, value);
  }

  static getCachedData(String key) {
    return userBox.get(key);
  }

  static cacheTaskData(String key, TaskModel value) {
    tasksBox.put(key, value);
  }

  static TaskModel? getCachedTask(String key) {
    return tasksBox.get(key);
  }
}
