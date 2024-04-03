import 'package:indivar_test/src/data/data_sources/local/home_data_source.dart';
import 'package:indivar_test/src/data/data_sources/remote/home_data_source.dart';
import 'package:indivar_test/src/domain/models/m_pokemon_detail.dart';
import 'package:indivar_test/src/domain/models/m_response_pokemon_list.dart';
import 'package:indivar_test/src/domain/models/m_secondary_detail.dart';
import 'package:indivar_test/src/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSourceLocal dataSourceLocal;
  final HomeDataSourceRemote dataSourceRemote;

  HomeRepositoryImpl(this.dataSourceLocal, this.dataSourceRemote);

  @override
  Future<List<SecondaryDetail>> getPokemonList(int offset, int limit) async {
    final response = await dataSourceRemote.getPokemonList(offset, limit);
    final code = response.statusCode;
    if (code == 200) {
      final data = RespPokemonList.fromJson(response.data);
      return data.pokemons;
    }
    return [];
  }

  @override
  Future<PokemonDetail?> getPokemonDetail(int id) async {
    final response = await dataSourceRemote.getPokemonDetail(id);
    final code = response.statusCode;
    if (code == 200) {
      final data = PokemonDetail.fromJson(response.data);
      return data;
    }
    return null;
  }
}
