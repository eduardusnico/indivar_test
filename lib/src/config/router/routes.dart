import 'package:get/get.dart';
import 'package:indivar_test/src/config/router/routes_name.dart';
import 'package:indivar_test/src/presentation/bindings/detail_pokemon_binding.dart';
import 'package:indivar_test/src/presentation/bindings/home_binding.dart';
import 'package:indivar_test/src/presentation/views/home_screen.dart';
import 'package:indivar_test/src/presentation/views/detail_pokemon_screen.dart';

class AppRoutes {
  static final route = [
    GetPage(
      name: AppRoutesName.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutesName.detail,
      page: () => DetailPokemonScreen(),
      binding: DetailPokemonBinding(),
    ),
  ];
}
