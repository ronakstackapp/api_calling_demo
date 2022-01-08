// import 'package:shared_preferences/shared_preferences.dart';
//
// const String is_logIn = 'is_logIn';
// const String is_socialLogin = 'is_socialLogin';
// const String user_details = 'user_details';
//
// getPrefStringValue(String key) async {
//   final prefs = await SharedPreferences.getInstance();
//   return prefs.getString(key) ?? '';
// }
//
// setPrefStringValue(String key, value) async {
//   final prefs = await SharedPreferences.getInstance();
//   prefs.setString(key, value);
// }
//
// getPrefBoolValue(String key) async {
//   final prefs = await SharedPreferences.getInstance();
//   return prefs.getBool(key);
// }
//
// setPrefBoolValue(String key, value) async {
//   final prefs = await SharedPreferences.getInstance();
//   prefs.setBool(key, value);
// }
//
// getPrefIntValue(String key) async {
//   final prefs = await SharedPreferences.getInstance();
//   return prefs.getInt(key) ?? null;
// }
//
// setPrefIntValue(String key, value) async {
//   final prefs = await SharedPreferences.getInstance();
//   prefs.setInt(key, value);
// }
//
// removePrefValue(String key) async {
//   final prefs = await SharedPreferences.getInstance();
//   prefs.remove(key);
// }
///share_pref