import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/models/m_pokemon_move.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_constants.dart';

class PokemonMovesListviewWidget extends StatelessWidget {
  const PokemonMovesListviewWidget({
    super.key,
    required this.moves,
  });

  final List<PokemonMove> moves;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.04,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(bottom: 5),
        itemCount: moves.length,
        itemBuilder: (context, i) {
          return Card(
            margin: EdgeInsets.only(right: i == moves.length - 1 ? 0 : 6),
            color: kMaroon,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              child: Text(
                moves[i].move.name,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: poppins,
                  color: kBrokenWhite,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
