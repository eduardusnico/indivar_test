import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indivar_test/src/presentation/controllers/detail_pokemon_controller.dart';
import 'package:indivar_test/src/presentation/widgets/pokemon_detail_header_widget.dart';
import 'package:indivar_test/src/presentation/widgets/title_with_percent_bar_widget.dart';
import 'package:indivar_test/src/utils/constants/app_colors.dart';
import 'package:indivar_test/src/utils/constants/app_constants.dart';

import '../widgets/pokemon_moves_listview_widget.dart';
import '../widgets/pokemon_types_widget.dart';
import '../widgets/pokemon_weight_height_widget.dart';

class DetailPokemonScreen extends StatelessWidget {
  final _dpController = Get.find<DetailPokemonController>();
  final bool isCatchable;
  DetailPokemonScreen({super.key, this.isCatchable = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => _dpController.isLoadingDetail.isTrue
              ? const Center(child: CircularProgressIndicator())
              : Column(children: [
                  PokemonDetailHeaderWidget(
                      pokemonId: _dpController.pokemonDetail.value.id),
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
                  PokemonTypesWidget(
                      types: _dpController.pokemonDetail.value.types),
                  const SizedBox(height: 20),
                  PokemonWeightHeightWidget(
                    height: _dpController.pokemonDetail.value.height,
                    weight: _dpController.pokemonDetail.value.weight,
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
                        PokemonMovesListviewWidget(
                            moves: _dpController.pokemonDetail.value.moves),
                        const SizedBox(height: 20),
                        TitleWithPercentBarWidget()
                      ],
                    ),
                  ),
                ]),
        ),
      ),
      floatingActionButton: _dpController.isCatchable.isFalse
          ? null
          : ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {
                _dpController.catchPokemon(_dpController.pokemonId.value);
              },
              icon: Image.asset(
                'assets/images/icon_ball.png',
                height: 20,
                color: Colors.white,
                width: 20,
              ),
              label: const Text('Catch',
                  style: TextStyle(
                    letterSpacing: 1,
                    fontFamily: poppins,
                  )),
            ),
    );
  }
}
