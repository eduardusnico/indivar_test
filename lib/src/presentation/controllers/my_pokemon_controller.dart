import 'package:get/get.dart';
import 'package:indivar_test/src/domain/models/m_pokemon_mini_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/data_sources/local/home_data_source.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../../utils/extensions/app_dialog.dart';

class MyPokemonController extends GetxController {
  late final HomeRepositoryImpl _repository;
  late final SharedPreferences _prefs;

  final myPokemonList = <PokemonMiniDetail>[].obs;
  final isLoadingMyPokemonList = false.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    _prefs = await SharedPreferences.getInstance();
    _setup(_prefs);
    getMyPokemonList();
  }

  void _setup(SharedPreferences prefs) {
    final HomeDataSourceLocal dataSourceLocal = HomeDataSourceLocal(_prefs);
    _repository = HomeRepositoryImpl(dataSourceLocal: dataSourceLocal);
  }

  void getMyPokemonList() {
    _changeLoading(true);
    final data = _repository.getPokemonListFromCache('my_pokemon');
    myPokemonList.assignAll(data);
    _changeLoading(false);
  }

  void _changeLoading(bool value) {
    isLoadingMyPokemonList.value = value;
  }

  void releasePokemon(int pokemonId) async {
    AppDialog.releasePokemon(
      topButtonPressed: () {
        Get.back();
        _sureToReleasePokemon(pokemonId);
      },
    );
  }

  void _sureToReleasePokemon(int pokemonId) {
    _removePokemonFromPrefs(pokemonId);
    getMyPokemonList();
  }

  void _removePokemonFromPrefs(int pokemonId) {
    _repository.removePokemonById('my_pokemon', pokemonId);
  }
}
