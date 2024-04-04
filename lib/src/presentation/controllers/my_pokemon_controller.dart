import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:indivar_test/src/domain/models/m_pokemon_mini_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/data_sources/local/home_data_source.dart';
import '../../data/data_sources/remote/home_data_source.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../../utils/extensions/app_dialog.dart';

class MyPokemonController extends GetxController {
  late final HomeRepositoryImpl _repository;
  late final SharedPreferences _prefs;
  late final Dio _dio;

  final myPokemonList = <PokemonMiniDetail>[].obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    _dio = Dio();
    _prefs = await SharedPreferences.getInstance();
    setup(_dio, _prefs);
    getMyPokemonList();
  }

  void setup(Dio dio, SharedPreferences prefs) {
    final HomeDataSourceLocal dataSourceLocal = HomeDataSourceLocal(_prefs);
    final HomeDataSourceRemote dataSourceRemote = HomeDataSourceRemote(dio);
    _repository = HomeRepositoryImpl(dataSourceLocal, dataSourceRemote);
  }

  void getMyPokemonList() {
    changeLoading(true);
    final tempList = _prefs.getString('my_pokemon') ?? "[]";
    final data = pokemonMiniDetailFromJson(tempList);
    myPokemonList.assignAll(data);
    changeLoading(false);
  }

  void changeLoading(bool value) {
    isLoadingMyPokemonList.value = value;
  }

  void releasePokemon(int pokemonId) async {
    AppDialog.releasePokemon(
      topButtonPressed: () {
        Get.back();
        sureToReleasePokemon(pokemonId);
      },
    );
  }

  void sureToReleasePokemon(int pokemonId) {
    removePokemonFromPrefs(pokemonId);
    getMyPokemonList();
  }

  void removePokemonFromPrefs(int pokemonId) {
    final String myPokemonJson = _prefs.getString('my_pokemon') ?? "[]";
    final myPokemonList = pokemonMiniDetailFromJson(myPokemonJson);
    myPokemonList.removeWhere((element) => element.id == pokemonId);
    final myNewPokemonJson = pokemonMiniDetailToJson(myPokemonList);
    _prefs.setString('my_pokemon', myNewPokemonJson);
  }

  final isLoadingMyPokemonList = false.obs;
}
