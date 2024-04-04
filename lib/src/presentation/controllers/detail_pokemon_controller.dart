import 'dart:math';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:indivar_test/src/presentation/controllers/my_pokemon_controller.dart';
import 'package:indivar_test/src/utils/extensions/app_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/data_sources/local/home_data_source.dart';
import '../../data/data_sources/remote/home_data_source.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../../domain/models/empty_models.dart';
import '../../domain/models/m_pokemon_detail.dart';
import '../../domain/models/m_pokemon_mini_detail.dart';
import '../../domain/models/m_pokemon_sprite.dart';

class DetailPokemonController extends GetxController {
  late final HomeRepositoryImpl _repository;
  late final SharedPreferences _prefs;
  late final Dio _dio;

  final maxStatValue = 300;

  final isLoadingDetail = false.obs;
  final pokemonId = 0.obs;
  final isCatchable = true.obs;

  final pokemonDetail = PokemonDetail(
    id: 0,
    name: '',
    height: 0,
    weight: 0,
    sprites: PokemonSprites(frontDefault: ''),
    moves: [],
    stats: [],
    types: [],
  ).obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    final args = Get.arguments;
    pokemonId.value = args["id"];
    isCatchable.value = args["catchable"] ?? true;

    _dio = Dio();
    _prefs = await SharedPreferences.getInstance();
    setup(_dio, _prefs);
    getPokemonDetail(pokemonId.value);
  }

  void setup(Dio dio, SharedPreferences prefs) {
    final HomeDataSourceLocal dataSourceLocal = HomeDataSourceLocal(_prefs);
    final HomeDataSourceRemote dataSourceRemote = HomeDataSourceRemote(dio);
    _repository = HomeRepositoryImpl(dataSourceLocal, dataSourceRemote);
  }

  void changeLoading(bool loading) {
    isLoadingDetail.value = loading;
  }

  void getPokemonDetail(int id) async {
    changeLoading(true);
    pokemonDetail.value =
        await _repository.getPokemonDetail(id) ?? kEmptyPokemonDetail;
    changeLoading(false);
  }

  void catchPokemon(int pokemonId) async {
    if (isPokemonOwned(pokemonId) == true) {
      AppDialog.alreadyOwnPokemon();
    } else {
      AppDialog.tryCatchPokemon(
        topButtonPressed: () {
          sureToCatchPokemon(pokemonId);
        },
      );
    }
  }

  void sureToCatchPokemon(int pokemonId) {
    final success = _generateRandomBoolean();
    if (success == true) {
      Get.back();
      AppDialog.successCatchPokemon();
      _addPokemonToPrefs(pokemonId);
      _updateMyPokemonList();
    } else {
      Get.back();
      AppDialog.failedCatchPokemon();
    }
  }

  void _updateMyPokemonList() {
    final mpC = Get.find<MyPokemonController>();
    mpC.getMyPokemonList();
  }

  void _addPokemonToPrefs(int pokemonId) {
    final String myPokemonJson = _prefs.getString('my_pokemon') ?? "[]";
    final myPokemonList = pokemonMiniDetailFromJson(myPokemonJson);
    myPokemonList.add(
      PokemonMiniDetail(
          name: pokemonDetail.value.name,
          url: 'https://pokeapi.co/api/v2/pokemon/$pokemonId',
          id: pokemonId),
    );
    final myNewPokemonJson = pokemonMiniDetailToJson(myPokemonList);
    _prefs.setString('my_pokemon', myNewPokemonJson);
  }

  bool isPokemonOwned(int pokemonId) {
    final String myPokemonJson = _prefs.getString('my_pokemon') ?? "[]";
    final myPokemonList = pokemonMiniDetailFromJson(myPokemonJson);
    final isOwned =
        myPokemonList.indexWhere((element) => element.id == pokemonId) == -1
            ? false
            : true;
    return isOwned;
  }

  bool _generateRandomBoolean() {
    final random = Random();
    final newValue = random.nextBool();
    return newValue;
  }
}
