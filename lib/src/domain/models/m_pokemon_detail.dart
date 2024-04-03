// To parse this JSON data, do
//
//     final pokemonDetail = pokemonDetailFromJson(jsonString);

import 'dart:convert';

import 'package:indivar_test/src/domain/models/m_pokemon_move.dart';
import 'package:indivar_test/src/domain/models/m_pokemon_sprite.dart';
import 'package:indivar_test/src/domain/models/m_pokemon_stat.dart';
import 'package:indivar_test/src/domain/models/m_pokemon_type.dart';

PokemonDetail pokemonDetailFromJson(String str) =>
    PokemonDetail.fromJson(json.decode(str));

String pokemonDetailToJson(PokemonDetail data) => json.encode(data.toJson());

class PokemonDetail {
  int id;
  String name;
  int height;
  int weight;
  PokemonSprites sprites;
  List<PokemonMove> moves;
  List<PokemonStat> stats;
  List<PokemonType> types;

  PokemonDetail({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.sprites,
    required this.moves,
    required this.stats,
    required this.types,
  });

  factory PokemonDetail.fromJson(Map<String, dynamic> json) => PokemonDetail(
        id: json["id"],
        name: json["name"],
        height: json["height"],
        weight: json["weight"],
        sprites: PokemonSprites.fromJson(json["sprites"]),
        moves: List<PokemonMove>.from(
            json["moves"].map((x) => PokemonMove.fromJson(x))),
        stats: List<PokemonStat>.from(
            json["stats"].map((x) => PokemonStat.fromJson(x))),
        types: List<PokemonType>.from(
            json["types"].map((x) => PokemonType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "height": height,
        "weight": weight,
        "sprites": sprites.toJson(),
        "moves": List<dynamic>.from(moves.map((x) => x.toJson())),
        "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
      };
}
