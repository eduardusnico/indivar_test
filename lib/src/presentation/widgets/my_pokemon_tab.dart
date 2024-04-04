// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:indivar_test/src/presentation/views/pokemon_detail_screen.dart';
// import 'package:indivar_test/src/utils/constants/app_padding.dart';

// import '../../utils/constants/app_constants.dart';

// class MyPokemonTab extends StatelessWidget {
//   const MyPokemonTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//           child: GridView.builder(
//             padding: kInsetsAll8,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               childAspectRatio: 0.8,
//               crossAxisCount: 2,
//             ),
//             itemCount: 5,
//             itemBuilder: (context, index) {
//               return InkWell(
//                 onTap: () => Get.to(() => const PokemonDetailScreen()),
//                 child: Card(
//                   color: const Color.fromARGB(255, 191, 88, 88),
//                   child: Padding(
//                     padding: kInsetsAll12,
//                     child: Column(mainAxisSize: MainAxisSize.min, children: [
//                       Container(
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(6),
//                           color: Colors.white,
//                         ),
//                         child: Image.network(
//                           'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png',
//                           cacheHeight: 96,
//                           cacheWidth: 96,
//                         ),
//                       ),
//                       SizedBox(
//                         height: Get.height * 0.02,
//                       ),
//                       const Text(
//                         'Ivysaur',
//                         style: TextStyle(
//                           fontSize: 15,
//                           color: Colors.white,
//                           fontFamily: poppins,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       )
//                     ]),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           items: const [
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.people), label: 'Catch Pokemon'),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.circle), label: 'My Pokemon')
//           ],
//         ));
//   }
// }
