import 'dart:math';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
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

  final _isLoadingDetail = false.obs;
  final _pokemonDetail = PokemonDetail(
    id: 0,
    name: '',
    height: 0,
    weight: 0,
    sprites: PokemonSprites(frontDefault: ''),
    moves: [],
    stats: [],
    types: [],
  ).obs;

  void changeLoading(bool loading) {
    _isLoadingDetail.value = loading;
  }

  void getPokemonDetail(int id) async {
    _pokemonDetail.value =
        await _repository.getPokemonDetail(id) ?? kEmptyPokemonDetail;
  }

  void catchPokemon(int pokemonId) async {
    if (isPokemonOwned(pokemonId) == true) {
      AppDialog.alreadyOwnPokemon();
    } else {
      final success = _generateRandomBoolean();
      if (success == true) {
        AppDialog.successCatchPokemon();
        _addPokemonToPrefs(pokemonId);
      } else {
        AppDialog.failedCatchPokemon();
      }
    }
  }

  void _addPokemonToPrefs(int pokemonId) {
    _prefs.setBool('pokemon_$pokemonId', true);
  }

  bool isPokemonOwned(int pokemonId) {
    return _prefs.getBool('pokemon_$pokemonId') ?? false;
  }

  bool _generateRandomBoolean() {
    final random = Random();
    final newValue = random.nextBool();
    return newValue;
  }
}