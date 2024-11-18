// import 'package:shared_preferences/shared_preferences.dart';

// class AppLocalStorage {
//   static late SharedPreferences sharedPreferences;

//   static init() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//   }

//   static cacheData(String key, dynamic value) async {
//     if (value is String) {
//       await sharedPreferences.setString(key, value);
//     } else if (value is bool) {
//       await sharedPreferences.setBool(key, value);
//     } else if (value is int) {
//       await sharedPreferences.setInt(key, value);
//     } else if (value is double) {
//       await sharedPreferences.setDouble(key, value);
//     } else if (value is List<String>) {
//       await sharedPreferences.setStringList(key, value);
//     }
//   }

//   static Future<dynamic> getData(String key) async {
//     return sharedPreferences.get(key);
//   }
// }
