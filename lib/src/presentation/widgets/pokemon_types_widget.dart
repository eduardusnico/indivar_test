import 'package:flutter/material.dart';
import 'package:indivar_test/src/domain/models/m_pokemon_type.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_constants.dart';

class PokemonTypesWidget extends StatelessWidget {
  final List<PokemonType> types;
  const PokemonTypesWidget({super.key, required this.types});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < types.length; i++)
          Container(
            margin: const EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
                color: kMaroon, borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            child: Text(
              types[i].type.name,
              style: const TextStyle(
                  fontSize: 12,
                  fontFamily: poppins,
                  color: kBrokenWhite,
                  fontWeight: FontWeight.w300),
            ),
          ),
      ],
    );
  }
}
