import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indivar_test/src/presentation/controllers/detail_pokemon_controller.dart';
import 'package:indivar_test/src/utils/constants/app_colors.dart';
import 'package:indivar_test/src/utils/constants/app_constants.dart';
import 'package:indivar_test/src/utils/constants/app_padding.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PokemonDetailScreen extends StatelessWidget {
  final _dpController = Get.find<DetailPokemonController>();
  final bool isOwned;
  PokemonDetailScreen({super.key, this.isOwned = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => _dpController.isLoadingDetail.isTrue
              ? const Center(child: CircularProgressIndicator())
              : Column(children: [
                  Card(
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
                                top: Get.height * 0.05,
                                right: Get.width * 0.12),
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
                            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${_dpController.pokemonId}.png',
                            height: Get.width * 0.5,
                            width: Get.width * 0.5,
                            fit: BoxFit.fitHeight,
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0, bottom: 8),
                    child: Text(
                      _dpController.pokemonDetail.value.name.capitalize!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: poppins,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0;
                          i < _dpController.pokemonDetail.value.types.length;
                          i++)
                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                              color: kMaroon,
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 12),
                          child: Text(
                            _dpController
                                .pokemonDetail.value.types[i].type.name,
                            style: const TextStyle(
                                fontSize: 12,
                                fontFamily: poppins,
                                color: kBrokenWhite,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              _dpController.pokemonDetail.value.weight
                                  .toDouble()
                                  .toString(),
                              style: const TextStyle(
                                  color: kCloud,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Weight',
                              style: TextStyle(
                                  color: kCloud,
                                  fontSize: 15.5,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              _dpController.pokemonDetail.value.height
                                  .toDouble()
                                  .toString(),
                              style: const TextStyle(
                                  color: kCloud,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Height',
                              style: TextStyle(
                                  color: kCloud,
                                  fontSize: 15.5,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    height: 30,
                    thickness: 1.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Moves',
                          style: TextStyle(
                              fontSize: 16,
                              color: kCloud,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: Get.height * 0.04,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.only(bottom: 5),
                            itemCount:
                                _dpController.pokemonDetail.value.moves.length,
                            itemBuilder: (context, i) {
                              return Card(
                                  margin: EdgeInsets.only(
                                      right: i ==
                                              _dpController.pokemonDetail.value
                                                      .moves.length -
                                                  1
                                          ? 0
                                          : 6),
                                  color: kMaroon,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 12),
                                    child: Text(
                                      _dpController.pokemonDetail.value.moves[i]
                                          .move.name,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontFamily: poppins,
                                          color: kBrokenWhite,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ));
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        for (int i = 0;
                            i < _dpController.pokemonDetail.value.stats.length;
                            i++)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _dpController
                                      .pokemonDetail.value.stats[i].stat.name,
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
                                  percent: _dpController.pokemonDetail.value
                                          .stats[i].baseStat /
                                      _dpController.maxStatValue,
                                  padding: kInsetsZero,
                                )
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                ]),
        ),
      ),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {
          _dpController.catchPokemon(_dpController.pokemonId.value);
        },
        icon: const Icon(Icons.circle),
        label: const Text('Catch'),
      ),
    );
  }
}
