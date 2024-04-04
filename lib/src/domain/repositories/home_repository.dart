import 'package:indivar_test/src/domain/models/m_pokemon_detail.dart';
import 'package:indivar_test/src/domain/models/m_pokemon_mini_detail.dart';

abstract class HomeRepository {
  //remote
  Future<List<PokemonMiniDetail>> getPokemonList(int offset, int limit);
  Future<PokemonDetail?> getPokemonDetail(int id);
  //local
  List<PokemonMiniDetail> getPokemonListFromCache(String key);
  bool checkExistedKey(String key);
  bool isPokemonOwned(String key, int pokemonId);
  PokemonDetail getPokemonDetailFromCache(String key, int pokemonId);
  void saveJsonAsCache(String key, String json);
  void removePokemonById(String key, int pokemonId);
  void addPokemonToMyPokemon(String key, int pokemonId, String pokemonName);
}
