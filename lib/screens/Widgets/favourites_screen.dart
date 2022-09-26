import 'package:flutter/material.dart';
import 'package:pokeapi/Utils/saved_data.dart';
import 'package:pokeapi/screens/Widgets/pokemon-detail/info_text.dart';
import 'package:pokeapi/screens/pokemon_card_screen.dart';

import '../../model/pokemon.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {

  List<Pokemon> pokemonList = [];

  _loadFavouritesPokemon() async {
    List<Pokemon> list = await SavedData.getSavedPokemon();
    setState(() => pokemonList = list);
  }

  List<Widget> _loadIntoWidgets(){
    List<Widget> result = [];
    for (var element in pokemonList) {
      result.add(PokemonCardScreen(pokemon: element));
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
    _loadFavouritesPokemon();
  }

  @override
  Widget build(BuildContext context) {
    Widget result;
    int crossAxisCount = (MediaQuery.of(context).size.width / 200).round();
    if(pokemonList.isEmpty){
      result = Center(
        child: SizedBox(
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              InfoText(title: 'Add pokemon to favourites'),
              Icon(Icons.favorite),
            ],
          ),
        ),
      );
    }else{
      result = GridView.count(
          crossAxisCount: crossAxisCount,
          padding: const EdgeInsets.all(12),
          children: _loadIntoWidgets(),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Favourites')),
      body: result,
    );
  }
}
