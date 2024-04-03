import 'package:indivar_test/src/domain/models/m_pokemon_detail.dart';
import 'package:indivar_test/src/domain/models/m_secondary_detail.dart';

abstract class HomeRepository {
  Future<List<SecondaryDetail>> getPokemonList(int offset, int limit);
  Future<PokemonDetail?> getPokemonDetail(int id);
}
