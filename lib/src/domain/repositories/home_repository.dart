import 'package:indivar_test/src/domain/models/m_pokemon_detail.dart';
import 'package:indivar_test/src/domain/models/m_pokemon_mini_detail.dart';

abstract class HomeRepository {
  Future<List<PokemonMiniDetail>> getPokemonList(int offset, int limit);
  Future<PokemonDetail?> getPokemonDetail(int id);
}
