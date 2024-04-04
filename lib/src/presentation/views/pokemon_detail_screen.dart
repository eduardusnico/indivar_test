import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indivar_test/src/utils/constants/app_colors.dart';
import 'package:indivar_test/src/utils/constants/app_constants.dart';
import 'package:indivar_test/src/utils/constants/app_padding.dart';
import 'package:indivar_test/src/utils/extensions/app_dialog.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PokemonDetailScreen extends StatelessWidget {
  final bool isOwned;
  const PokemonDetailScreen({super.key, this.isOwned = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
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
                        top: Get.height * 0.05, right: Get.width * 0.12),
                    child: const Icon(
                      Icons.chevron_left,
                      size: 40,
                      color: kCloud,
                    ),
                  ),
                  Image.network(
                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png',
                    height: Get.width * 0.5,
                    width: Get.width * 0.5,
                    fit: BoxFit.fitHeight,
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18.0, bottom: 8),
            child: Text(
              "Venusaur",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: poppins,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: kMaroon, borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            child: const Text(
              'grass',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: poppins,
                  color: kBrokenWhite,
                  fontWeight: FontWeight.w300),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      '1000.0',
                      style: TextStyle(
                          color: kCloud,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 4),
                    Text(
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
                      '20.0',
                      style: TextStyle(
                          color: kCloud,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 4),
                    Text(
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
                      fontSize: 16, color: kCloud, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: Get.height * 0.04,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(bottom: 5),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Card(
                          margin:
                              //TODO ganti 10
                              EdgeInsets.only(right: index == 10 - 1 ? 0 : 6),
                          color: kMaroon,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 12),
                            child: Text(
                              'grass',
                              style: TextStyle(
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
                for (int i = 0; i < 5; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Attack',
                          style: TextStyle(
                              color: kCloud,
                              fontFamily: poppins,
                              fontWeight: FontWeight.w600),
                        ),
                        LinearPercentIndicator(
                          width: Get.width * 0.5,
                          lineHeight: 20,
                          barRadius: const Radius.circular(20),
                          progressColor: kMaroon,
                          center: const Text(
                            '30 / 300',
                            style: TextStyle(fontSize: 12.5),
                          ),
                          percent: 0.3,
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
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {
          AppDialog.releasePokemon();
        },
        icon: const Icon(Icons.circle),
        label: const Text('Catch'),
      ),
    );
  }
}
