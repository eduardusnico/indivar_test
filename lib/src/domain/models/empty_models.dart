import 'm_pokemon_detail.dart';
import 'm_pokemon_sprite.dart';

final kEmptyPokemonDetail = PokemonDetail(
  id: 0,
  name: '',
  height: 0,
  weight: 0,
  sprites: kEmptyPokemonSprites,
  moves: [],
  stats: [],
  types: [],
);

final kEmptyPokemonSprites = PokemonSprites(frontDefault: '');
