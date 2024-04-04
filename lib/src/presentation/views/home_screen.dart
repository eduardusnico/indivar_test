import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indivar_test/src/presentation/widgets/my_pokemon_tab.dart';

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
            onTap: (value) {
              index.value = value;
            },
            currentIndex: index.value,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.people), label: 'Catch Pokemon'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.circle), label: 'My Pokemon')
            ],
          ),
        ));
  }
}
