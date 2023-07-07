import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUsertoStoredPref(name, phone) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString("name", name);
  preferences.setString("phone", phone);
}
