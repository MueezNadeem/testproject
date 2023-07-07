import 'package:shared_preferences/shared_preferences.dart';

Future<String?> getUserFromStoredPref() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getString("phone");
}
