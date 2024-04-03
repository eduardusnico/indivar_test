import 'm_secondary_detail.dart';

class PokemonStat {
  int baseStat;
  SecondaryDetail stat;

  PokemonStat({
    required this.baseStat,
    required this.stat,
  });

  factory PokemonStat.fromJson(Map<String, dynamic> json) => PokemonStat(
        baseStat: json["base_stat"],
        stat: SecondaryDetail.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "stat": stat.toJson(),
      };
}
