import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indivar_test/src/presentation/controllers/my_pokemon_controller.dart';
import 'package:indivar_test/src/utils/constants/app_colors.dart';

import '../../config/router/routes_name.dart';
import '../../utils/constants/app_padding.dart';
import 'pokemon_card_widget.dart';

class MyPokemonTab extends StatelessWidget {
  final _mpController = Get.find<MyPokemonController>();

  MyPokemonTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _mpController.isLoadingMyPokemonList.isTrue
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: kInsetsAll8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.8,
                crossAxisCount: 2,
              ),
              itemCount: _mpController.myPokemonList.length,
              itemBuilder: (context, i) {
                return Stack(
                  children: [
                    PokemonCardWidget(
                        index: i,
                        onTap: () => Get.toNamed(AppRoutesName.detail,
                                arguments: {
                                  "id": _mpController.myPokemonList[i].id,
                                  "catchable": false
                                }),
                        id: _mpController.myPokemonList[i].id,
                        name: _mpController.myPokemonList[i].name),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: InkWell(
                        onTap: () => _mpController
                            .releasePokemon(_mpController.myPokemonList[i].id),
                        child: Container(
                          padding: kInsetsAll8,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: kCloud,
                          ),
                          child: const Icon(
                            Icons.delete,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
    );
  }
}
