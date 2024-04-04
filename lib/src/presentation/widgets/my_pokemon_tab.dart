import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indivar_test/src/presentation/controllers/my_pokemon_controller.dart';
import 'package:indivar_test/src/utils/constants/app_colors.dart';

import '../../config/router/routes_name.dart';
import '../../utils/constants/app_constants.dart';
import '../../utils/constants/app_padding.dart';

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
                    InkWell(
                      onTap: () => Get.toNamed(AppRoutesName.detail,
                          arguments: {
                            "id": _mpController.myPokemonList[i].id,
                            "catchable": false
                          }),
                      child: Card(
                        color: const Color.fromARGB(255, 191, 88, 88),
                        child: Padding(
                          padding: kInsetsAll12,
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.white,
                              ),
                              child: Image.network(
                                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${_mpController.myPokemonList[i].id}.png',
                                cacheHeight: 96,
                                cacheWidth: 96,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Text(
                              _mpController.myPokemonList[i].name.capitalize!,
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
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: InkWell(
                        onTap: () => _mpController
                            .releasePokemon(_mpController.myPokemonList[i].id),
                        child: Container(
                          padding: kInsetsAll8,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: kCloud),
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
