import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_padding.dart';

class PokemonDetailHeaderWidget extends StatelessWidget {
  final int pokemonId;
  const PokemonDetailHeaderWidget({
    super.key,
    required this.pokemonId,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: kInsetsZero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: kInsetsAll8,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: Get.height * 0.05, right: Get.width * 0.12),
              child: InkWell(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.chevron_left,
                  size: 40,
                  color: kCloud,
                ),
              ),
            ),
            Image.network(
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$pokemonId.png',
              height: Get.width * 0.5,
              width: Get.width * 0.5,
              fit: BoxFit.fitHeight,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
