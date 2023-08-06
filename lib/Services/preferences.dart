import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static Future<void> saveUserDetails(String email, String password) async {
    SharedPreferences instance = await SharedPreferences.getInstance();

    await instance.setString("email", email);
    await instance.setString("password", password);
    Logger().d("Details Saved");
  }

  static Future<Map<String, dynamic>> fetchUserDetails() async {
    SharedPreferences instance = await SharedPreferences.getInstance();

    String? email = instance.getString("email");
    String? password = instance.getString("password");
    Logger().d("Fetched userdetails");
    return {
      "email": email,
      "password": password,
    };
  }

  static Future<void> clear() async {
    SharedPreferences instance = await SharedPreferences.getInstance();

    instance.clear();
  }
}
