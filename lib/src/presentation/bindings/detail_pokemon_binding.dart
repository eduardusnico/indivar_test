import 'package:get/get.dart';
import 'package:indivar_test/src/presentation/controllers/detail_pokemon_controller.dart';

class DetailPokemonBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailPokemonController());
  }
}
