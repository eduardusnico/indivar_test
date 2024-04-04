import 'package:flutter/material.dart';

import '../../utils/constants/app_colors.dart';

class PokemonWeightHeightWidget extends StatelessWidget {
  final int height;
  final int weight;
  const PokemonWeightHeightWidget({
    required this.height,
    required this.weight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TitleWithDoubleValueWidget(title: 'Weight', value: weight),
          TitleWithDoubleValueWidget(title: 'Height', value: height)
        ],
      ),
    );
  }
}

class TitleWithDoubleValueWidget extends StatelessWidget {
  const TitleWithDoubleValueWidget({
    super.key,
    required this.value,
    required this.title,
  });

  final int value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value.toDouble().toString(),
          style: const TextStyle(
              color: kCloud, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(
              color: kCloud, fontSize: 15.5, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
