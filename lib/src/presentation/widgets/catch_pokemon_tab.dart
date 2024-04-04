import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indivar_test/src/config/router/routes_name.dart';
import 'package:indivar_test/src/presentation/controllers/home_controller.dart';
import 'package:indivar_test/src/presentation/views/pokemon_detail_screen.dart';
import 'package:indivar_test/src/utils/constants/app_padding.dart';

import '../../utils/constants/app_constants.dart';

class CatchPokemonTab extends StatelessWidget {
  final _hController = Get.find<HomeController>();
  CatchPokemonTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _hController.isLoadingList.isTrue
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: kInsetsAll8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.8,
                crossAxisCount: 2,
              ),
              itemCount: _hController.pokemonList.length,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () => Get.toNamed(AppRoutesName.detail,
                      arguments: _hController.pokemonIdList[i]),
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
                            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${_hController.pokemonIdList[i]}.png',
                            cacheHeight: 96,
                            cacheWidth: 96,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Text(
                          _hController.pokemonList[i].name.capitalize!,
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
              },
            ),
    );
  }
}
