class PokemonSprites {
  String frontDefault;

  PokemonSprites({
    required this.frontDefault,
  });

  factory PokemonSprites.fromJson(Map<String, dynamic> json) => PokemonSprites(
        frontDefault: json["front_default"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
      };
}
