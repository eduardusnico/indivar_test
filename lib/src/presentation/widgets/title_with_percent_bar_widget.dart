import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:indivar_test/src/presentation/controllers/detail_pokemon_controller.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_constants.dart';
import '../../utils/constants/app_padding.dart';

class TitleWithPercentBarWidget extends StatelessWidget {
  final _dpController = Get.find<DetailPokemonController>();
  TitleWithPercentBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < _dpController.pokemonDetail.value.stats.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _dpController.pokemonDetail.value.stats[i].stat.name,
                  style: const TextStyle(
                      color: kCloud,
                      fontFamily: poppins,
                      fontWeight: FontWeight.w600),
                ),
                LinearPercentIndicator(
                  width: Get.width * 0.5,
                  lineHeight: 20,
                  barRadius: const Radius.circular(20),
                  progressColor: kMaroon,
                  center: Text(
                    '${_dpController.pokemonDetail.value.stats[i].baseStat} / 300',
                    style: const TextStyle(fontSize: 12.5),
                  ),
                  percent: _dpController.pokemonDetail.value.stats[i].baseStat /
                      _dpController.maxStatValue,
                  padding: kInsetsZero,
                )
              ],
            ),
          )
      ],
    );
  }
}
