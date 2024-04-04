import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indivar_test/src/presentation/widgets/my_pokemon_tab.dart';
import 'package:indivar_test/src/utils/constants/app_colors.dart';

import '../widgets/catch_pokemon_tab.dart';

class HomeScreen extends StatelessWidget {
  final index = 0.obs;
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child:
              Obx(() => index.value == 0 ? CatchPokemonTab() : MyPokemonTab()),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            selectedItemColor: kMaroon,
            onTap: (value) {
              index.value = value;
            },
            currentIndex: index.value,
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/icon_catch.png',
                    height: 20,
                    width: 20,
                    color: index.value == 0 ? kMaroon : kCloud,
                  ),
                  label: 'Catch Pokemon'),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/icon_ball.png',
                    height: 20,
                    width: 20,
                    color: index.value == 1 ? kMaroon : kCloud,
                  ),
                  label: 'My Pokemon')
            ],
          ),
        ));
  }
}
