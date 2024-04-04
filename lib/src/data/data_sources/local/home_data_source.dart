import 'package:shared_preferences/shared_preferences.dart';

class HomeDataSourceLocal {
  final SharedPreferences prefs;

  HomeDataSourceLocal(this.prefs);

  void setJsonByKey(String key, String value) {
    prefs.setString(key, value);
  }

  String? getJsonByKey(String key) {
    return prefs.getString(key);
  }
}
