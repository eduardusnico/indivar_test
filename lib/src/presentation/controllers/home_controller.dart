import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:indivar_test/src/data/data_sources/local/home_data_source.dart';
import 'package:indivar_test/src/data/data_sources/remote/home_data_source.dart';
import 'package:indivar_test/src/data/repositories/home_repository_impl.dart';
import 'package:indivar_test/src/domain/models/m_secondary_detail.dart';
import 'package:indivar_test/src/domain/repositories/home_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  late final HomeRepositoryImpl _repository;
  late final SharedPreferences _prefs;
  late final Dio _dio;

  final _isLoadingList = false.obs;
  final _pokemonList = <SecondaryDetail>[].obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    _dio = Dio();
    _prefs = await SharedPreferences.getInstance();
    setup(_dio, _prefs);
  }

  void setup(Dio dio, SharedPreferences prefs) {
    final HomeDataSourceLocal dataSourceLocal = HomeDataSourceLocal(_prefs);
    final HomeDataSourceRemote dataSourceRemote = HomeDataSourceRemote(dio);
    _repository = HomeRepositoryImpl(dataSourceLocal, dataSourceRemote);
  }

  void changeLoading(bool loading) {
    _isLoadingList.value = loading;
  }

  void getPokemonList(int offset, int limit) async {
    _pokemonList.value = await _repository.getPokemonList(offset, limit);
  }
}
