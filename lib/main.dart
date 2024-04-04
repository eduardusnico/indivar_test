import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indivar_test/src/config/router/routes_name.dart';
import 'package:indivar_test/src/presentation/bindings/detail_pokemon_binding.dart';
import 'package:indivar_test/src/presentation/bindings/home_binding.dart';
import 'package:indivar_test/src/presentation/views/home_screen.dart';
import 'package:indivar_test/src/utils/constants/app_colors.dart';
import 'package:indivar_test/src/utils/constants/app_constants.dart';

import 'src/presentation/views/pokemon_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kMaroon,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(backgroundColor: kTomato)),
        textTheme: Theme.of(context).textTheme.apply(
            bodyColor: kBlack, displayColor: kBlack, fontFamily: montserrat),
      ),
      defaultTransition: Transition.cupertino,
      getPages: [
        GetPage(
            name: AppRoutesName.home,
            binding: HomeBinding(),
            page: () => const CatchPokemonTab()),
        GetPage(
            name: AppRoutesName.detail,
            binding: DetailPokemonBinding(),
            page: () => const PokemonDetailScreen())
      ],
      initialRoute: "/",
    );
  }
}
