import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:indivar_test/src/data/data_sources/local/home_data_source.dart';
import 'package:indivar_test/src/data/data_sources/remote/home_data_source.dart';
import 'package:indivar_test/src/data/repositories/home_repository_impl.dart';
import 'package:indivar_test/src/domain/models/m_pokemon_mini_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
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
    setup(_dio, _prefs);
    getPokemonList(20, 20);
  }

  void setup(Dio dio, SharedPreferences prefs) {
    final HomeDataSourceLocal dataSourceLocal = HomeDataSourceLocal(_prefs);
    final HomeDataSourceRemote dataSourceRemote = HomeDataSourceRemote(dio);
    _repository = HomeRepositoryImpl(dataSourceLocal, dataSourceRemote);
  }

  void changeLoading(bool loading) {
    isLoadingList.value = loading;
  }

  void getPokemonList(int offset, int limit) async {
    changeLoading(true);
    pokemonList.value = await _repository.getPokemonList(offset, limit);
    changeLoading(false);
  }
}
