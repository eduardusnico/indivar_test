import 'm_secondary_detail.dart';

class PokemonMove {
  SecondaryDetail move;

  PokemonMove({
    required this.move,
  });

  factory PokemonMove.fromJson(Map<String, dynamic> json) => PokemonMove(
        move: SecondaryDetail.fromJson(json["move"]),
      );

  Map<String, dynamic> toJson() => {
        "move": move.toJson(),
      };
}
