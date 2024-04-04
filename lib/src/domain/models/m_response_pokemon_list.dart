import 'dart:convert';
import 'package:indivar_test/src/domain/models/m_pokemon_mini_detail.dart';

RespPokemonList respPokemonListFromJson(String str) =>
    RespPokemonList.fromJson(json.decode(str));

String respPokemonListToJson(RespPokemonList data) =>
    json.encode(data.toJson());

class RespPokemonList {
  int count;
  String next;
  String previous;
  List<PokemonMiniDetail> pokemons;

  RespPokemonList({
    required this.count,
    required this.next,
    required this.previous,
    required this.pokemons,
  });

  factory RespPokemonList.fromJson(Map<String, dynamic> json) =>
      RespPokemonList(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        pokemons: List<PokemonMiniDetail>.from(
            json["results"].map((x) => PokemonMiniDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(pokemons.map((x) => x.toJson())),
      };
}
