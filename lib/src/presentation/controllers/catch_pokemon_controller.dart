import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:indivar_test/src/data/data_sources/local/home_data_source.dart';
import 'package:indivar_test/src/data/data_sources/remote/home_data_source.dart';
import 'package:indivar_test/src/data/repositories/home_repository_impl.dart';
import 'package:indivar_test/src/domain/models/m_pokemon_mini_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CatchPokemonController extends GetxController {
  late final HomeRepositoryImpl _repository;
  late final SharedPreferences _prefs;
  late final Dio _dio;

  final isLoadingList = false.obs;
  final pokemonList = <PokemonMiniDetail>[].obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    _dio = Dio();
    _prefs = await SharedPreferences.getInstance();
    _setup(_dio, _prefs);
    _getPokemonList(20, 20);
  }

  void _setup(Dio dio, SharedPreferences prefs) {
    final HomeDataSourceLocal dataSourceLocal = HomeDataSourceLocal(_prefs);
    final HomeDataSourceRemote dataSourceRemote = HomeDataSourceRemote(dio);
    _repository = HomeRepositoryImpl(
      dataSourceLocal: dataSourceLocal,
      dataSourceRemote: dataSourceRemote,
    );
  }

  void _changeLoading(bool loading) {
    isLoadingList.value = loading;
  }

  bool _pokemonListExistInCache() {
    return _repository.checkExistedKey('pokemon_list');
  }

  void _savePokemonListToCache(String json) {
    _repository.saveJsonAsCache('pokemon_list', json);
  }

  void _getPokemonListFromCache() {
    final data = _repository.getPokemonListFromCache('pokemon_list');
    pokemonList.assignAll(data);
  }

  void _getPokemonListFromAPI(int offset, int limit) async {
    final data = await _repository.getPokemonList(offset, limit);
    final json = pokemonMiniDetailToJson(data);
    _savePokemonListToCache(json);
    pokemonList.value = data;
  }

  void _getPokemonList(int offset, int limit) async {
    _changeLoading(true);
    if (_pokemonListExistInCache() == true) {
      _getPokemonListFromCache();
    } else {
      _getPokemonListFromAPI(offset, limit);
    }
    _changeLoading(false);
  }
}
