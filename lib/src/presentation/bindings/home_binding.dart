import 'package:get/get.dart';
import 'package:indivar_test/src/presentation/controllers/catch_pokemon_controller.dart';
import 'package:indivar_test/src/presentation/controllers/my_pokemon_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CatchPokemonController());
    Get.put(MyPokemonController());
  }
}
