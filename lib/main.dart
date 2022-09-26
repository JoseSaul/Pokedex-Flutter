import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapi/Screens/pokedex_screen.dart';
import 'package:pokeapi/screens/Widgets/favourites_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      home: Builder(builder: (BuildContext context) =>
          Scaffold(
            body: const PokedexScreen(),
            floatingActionButton: SizedBox(
              height: 80,
              child: FittedBox(
                child: FloatingActionButton(
                  tooltip: 'Favourites',
                  backgroundColor: Colors.lightBlueAccent.withOpacity(0.3),
                  elevation: 0,
                  onPressed: () => Navigator.push(context, MaterialPageRoute( builder: (context) => const FavouritesScreen() )),
                  child: const Icon(Icons.favorite, color: Colors.redAccent),
                ),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          ),
        ),
    );
  }
}
