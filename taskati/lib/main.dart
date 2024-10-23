import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/themes.dart';
import 'package:taskati/feature/splash_view.dart';

// class model for task data
// generate type adapter for model
// annotate model with @HiveType and its field with @HiveField
// run flutter pub run build_runner build
// register adapter with Hive
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox('userBox');
  await Hive.openBox<TaskModel>('tasksBox');
  await AppLocalStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: AppLocalStorage.userBox.listenable(),
        builder: (context, box, widget) {
          var isDark = AppLocalStorage.getCachedData("isDarkMode") ?? false;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            home: const SplashView(),
          );
        });
  }
}
