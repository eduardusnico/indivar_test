import 'package:indivar_test/src/data/data_sources/local/home_data_source.dart';
import 'package:indivar_test/src/data/data_sources/remote/home_data_source.dart';
import 'package:indivar_test/src/domain/models/m_pokemon_detail.dart';
import 'package:indivar_test/src/domain/models/m_pokemon_mini_detail.dart';
import 'package:indivar_test/src/domain/models/m_response_pokemon_list.dart';
import 'package:indivar_test/src/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSourceLocal? dataSourceLocal;
  final HomeDataSourceRemote? dataSourceRemote;

  HomeRepositoryImpl({this.dataSourceLocal, this.dataSourceRemote});

  @override
  Future<List<PokemonMiniDetail>> getPokemonList(int offset, int limit) async {
    final response = await dataSourceRemote!.getPokemonList(offset, limit);
    final code = response.statusCode;
    if (code == 200) {
      final data = RespPokemonList.fromJson(response.data);
      return data.pokemons;
    }
    return [];
  }

  @override
  Future<PokemonDetail?> getPokemonDetail(int id) async {
    final response = await dataSourceRemote!.getPokemonDetail(id);
    final code = response.statusCode;
    if (code == 200) {
      final data = PokemonDetail.fromJson(response.data);
      return data;
    }
    return null;
  }

  @override
  void saveJsonAsCache(String key, String json) async {
    dataSourceLocal!.setJsonByKey(key, json);
  }

  @override
  List<PokemonMiniDetail> getPokemonListFromCache(String key) {
    final response = dataSourceLocal!.getJsonByKey(key) ?? '[]';
    return pokemonMiniDetailFromJson(response);
  }

  @override
  void removePokemonById(String key, int pokemonId) async {
    final response = dataSourceLocal!.getJsonByKey(key) ?? '[]';
    final myPokemonList = pokemonMiniDetailFromJson(response);
    myPokemonList.removeWhere((element) => element.id == pokemonId);
    final myNewPokemonJson = pokemonMiniDetailToJson(myPokemonList);
    dataSourceLocal!.setJsonByKey(key, myNewPokemonJson);
  }

  @override
  bool checkExistedKey(String key) {
    final response = dataSourceLocal!.getJsonByKey(key);
    if (response != null) {
      return true;
    }
    return false;
  }

  @override
  void addPokemonToMyPokemon(
      String key, int pokemonId, String pokemonName) async {
    final response = dataSourceLocal!.getJsonByKey(key) ?? "[]";
    final myPokemonList = pokemonMiniDetailFromJson(response);
    myPokemonList.add(
      PokemonMiniDetail(
          name: pokemonName,
          url: 'https://pokeapi.co/api/v2/pokemon/$pokemonId',
          id: pokemonId),
    );
    final updatedPokemonJson = pokemonMiniDetailToJson(myPokemonList);
    dataSourceLocal!.setJsonByKey(key, updatedPokemonJson);
  }

  @override
  bool isPokemonOwned(String key, int pokemonId) {
    final response = dataSourceLocal!.getJsonByKey(key) ?? "[]";
    final myPokemonList = pokemonMiniDetailFromJson(response);
    final isOwned =
        myPokemonList.indexWhere((element) => element.id == pokemonId) == -1
            ? false
            : true;
    return isOwned;
  }

  @override
  PokemonDetail getPokemonDetailFromCache(String key, int pokemonId) {
    final response = dataSourceLocal!.getJsonByKey(key);
    return pokemonDetailFromJson(response!);
  }
}
