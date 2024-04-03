import 'package:flutter/material.dart';
import 'package:indivar_test/src/utils/constants/app_padding.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          body: SafeArea(
            child: GridView.builder(
              padding: kPaddingAll8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.8,
                crossAxisCount: 2,
              ),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  color: const Color.fromARGB(255, 191, 88, 88),
                  child: Padding(
                    padding: kPaddingAll12,
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white,
                        ),
                        child: Image.network(
                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png',
                          cacheHeight: 96,
                          cacheWidth: 96,
                        ),
                      ),
                      const Text(
                        'Venusaur',
                        style: TextStyle(color: Colors.white),
                      )
                    ]),
                  ),
                );
              },
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.people), label: 'Catch Pokemon'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.circle), label: 'My Pokemon')
            ],
          )),
    );
  }
}
