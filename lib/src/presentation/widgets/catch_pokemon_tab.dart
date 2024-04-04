import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indivar_test/src/config/router/routes_name.dart';
import 'package:indivar_test/src/presentation/controllers/catch_pokemon_controller.dart';
import 'package:indivar_test/src/presentation/widgets/pokemon_card_widget.dart';
import 'package:indivar_test/src/utils/constants/app_padding.dart';

class CatchPokemonTab extends StatelessWidget {
  final _cpController = Get.find<CatchPokemonController>();
  CatchPokemonTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _cpController.isLoadingList.isTrue
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: kInsetsAll8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.8,
                crossAxisCount: 2,
              ),
              itemCount: _cpController.pokemonList.length,
              itemBuilder: (context, i) {
                return PokemonCardWidget(
                    index: i,
                    onTap: () => Get.toNamed(AppRoutesName.detail, arguments: {
                          "id": _cpController.pokemonList[i].id,
                        }),
                    id: _cpController.pokemonList[i].id,
                    name: _cpController.pokemonList[i].name);
              },
            ),
    );
  }
}
