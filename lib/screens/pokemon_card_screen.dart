import 'package:flutter/material.dart';
import 'package:pokeapi/screens/Widgets/sprite_widget.dart';
import 'package:pokeapi/screens/Widgets/type_symbol_widget.dart';
import 'package:pokeapi/screens/pokemon_detail_screen.dart';

import '../model/pokemon.dart';

class PokemonCardScreen extends StatelessWidget {
  const PokemonCardScreen({
    Key? key,
    required this.pokemon
  }) : super(key: key);

  final Pokemon pokemon;

  onclick(){
    return PokemonDetailScreen(
        pokemon: pokemon,
    );
  }
  
  @override
  Widget build(BuildContext context) {

    return Card(
      color: Colors.transparent,
      elevation: 0,
      child:  InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute( builder: (context) => onclick() )),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            image: DecorationImage(
              image: const AssetImage('assets/pokeball_background1.png'),
              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              Text(pokemon.getName(), style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20 , color: Colors.white)),
              SpriteWidget(imageUrl: pokemon.sprites.spriteUrl),
              TypeSymbol(types: pokemon.types),
            ],
          ),
        ),
      ),
    );
  }
}
