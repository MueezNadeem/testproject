import 'package:shared_preferences/shared_preferences.dart';

class CheckUserRegistered {
  static Future<bool> userDataExists() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userKey = preferences.getString('userKey');
    return !(userKey == null);
  }
}
