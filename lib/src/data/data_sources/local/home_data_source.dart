import 'package:shared_preferences/shared_preferences.dart';

class HomeDataSourceLocal {
  final SharedPreferences prefs;

  HomeDataSourceLocal(this.prefs);

  Future<void> getPokemonListFromCache(int offset, int limit) async {}

  Future<void> getPokemonDetailFromCache(int id) async {}
}
