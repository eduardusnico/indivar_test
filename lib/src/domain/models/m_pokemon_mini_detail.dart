import 'dart:convert';

List<PokemonMiniDetail> pokemonMiniDetailFromJson(String str) =>
    List<PokemonMiniDetail>.from(
        json.decode(str).map((x) => PokemonMiniDetail.fromJson(x)));

String pokemonMiniDetailToJson(List<PokemonMiniDetail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

int _splitId(String url) {
  final splittedUrl = url.split('pokemon/');
  final id = splittedUrl.last.replaceAll('/', '');
  return int.parse(id);
}

class PokemonMiniDetail {
  String name;
  String url;
  int id;

  PokemonMiniDetail({
    required this.name,
    required this.url,
    required this.id,
  });

  factory PokemonMiniDetail.fromJson(Map<String, dynamic> json) =>
      PokemonMiniDetail(
          name: json["name"], url: json["url"], id: _splitId(json["url"]));

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "id": id,
      };
}
