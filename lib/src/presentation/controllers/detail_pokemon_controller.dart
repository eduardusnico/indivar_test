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
    _setup(_dio, _prefs);
    _getPokemonDetail(pokemonId.value);
  }

  void _setup(Dio dio, SharedPreferences prefs) {
    final HomeDataSourceLocal dataSourceLocal = HomeDataSourceLocal(_prefs);
    final HomeDataSourceRemote dataSourceRemote = HomeDataSourceRemote(dio);
    _repository = HomeRepositoryImpl(
        dataSourceLocal: dataSourceLocal, dataSourceRemote: dataSourceRemote);
  }

  void _changeLoading(bool loading) {
    isLoadingDetail.value = loading;
  }

  void _getPokemonDetail(int id) async {
    _changeLoading(true);
    if (_isPokemonDetailExistInCache(id) == true) {
      _getPokemonDetailFromCache(id);
    } else {
      _getPokemonDetailFromAPI(id);
    }
    _changeLoading(false);
  }

  void catchPokemon(int pokemonId) async {
    if (_isPokemonOwned(pokemonId) == true) {
      AppDialog.alreadyOwnPokemon();
    } else {
      AppDialog.tryCatchPokemon(
        topButtonPressed: () {
          _sureToCatchPokemon(pokemonId);
        },
      );
    }
  }

  void _sureToCatchPokemon(int pokemonId) {
    final success = _generateRandomBoolean();
    if (success == true) {
      Get.back();
      AppDialog.successCatchPokemon();
      _addPokemonToMyPokemon(pokemonId);
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

  void _addPokemonToMyPokemon(int pokemonId) {
    _repository.addPokemonToMyPokemon(
        'my_pokemon', pokemonId, pokemonDetail.value.name);
  }

  bool _isPokemonOwned(int pokemonId) {
    return _repository.isPokemonOwned('my_pokemon', pokemonId);
  }

  bool _generateRandomBoolean() {
    final random = Random();
    final newValue = random.nextBool();
    return newValue;
  }

  void _getPokemonDetailFromAPI(int id) async {
    final data = await _repository.getPokemonDetail(id) ?? kEmptyPokemonDetail;
    final json = pokemonDetailToJson(data);
    _savePokemonDetailToCache(id, json);
    pokemonDetail.value = data;
  }

  void _savePokemonDetailToCache(int pokemonId, String json) {
    _repository.saveJsonAsCache('pokemon_$pokemonId', json);
  }

  bool _isPokemonDetailExistInCache(int pokemonId) {
    return _repository.checkExistedKey('pokemon_$pokemonId');
  }

  void _getPokemonDetailFromCache(int pokemonId) {
    final data =
        _repository.getPokemonDetailFromCache('pokemon_$pokemonId', pokemonId);
    pokemonDetail.value = data;
  }
}
