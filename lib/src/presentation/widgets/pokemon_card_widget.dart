import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/app_constants.dart';
import '../../utils/constants/app_padding.dart';

class PokemonCardWidget extends StatelessWidget {
  final int index;
  final VoidCallback? onTap;
  final int id;
  final String name;

  const PokemonCardWidget({
    super.key,
    required this.index,
    required this.onTap,
    required this.id,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: const Color.fromARGB(255, 191, 88, 88),
        child: Padding(
          padding: kInsetsAll12,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
              ),
              child: Image.network(
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png',
                cacheHeight: 96,
                cacheWidth: 96,
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Text(
              name.capitalize!,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontFamily: poppins,
                fontWeight: FontWeight.w500,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
