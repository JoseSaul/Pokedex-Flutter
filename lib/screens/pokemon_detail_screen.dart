import 'package:flutter/material.dart';
import 'package:pokeapi/screens/Widgets/pokemon-detail/pokemon_detail_sprite_screen.dart';
import 'package:pokeapi/screens/Widgets/pokemon-detail/pokemon_detail_info_screen.dart';

import '../model/pokemon.dart';
import 'Widgets/like_button.dart';

class PokemonDetailScreen extends StatelessWidget {
  const PokemonDetailScreen({Key? key, required this.pokemon})
      : super(key: key);

  final Pokemon pokemon;

  String formatId(int id) {
    if (id > 99) {
      return '#$id';
    } else if (id > 9) {
      return '#0$id';
    } else {
      return '#00$id';
    }
  }

  double getHeightSize(double height, int percent) {
    height -= 40;
    return height * (percent / 100);
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white);
    List<Color> colors = [
      pokemon.types[0].type.getColorOfType(),
      pokemon.types.length > 1 ?
        pokemon.types[1].type.getColorOfType() : pokemon.types[0].type.getColorOfType(),
    ];

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(pokemon.getName(), style: textStyle),
          elevation: 0,
          backgroundColor: Colors.white30,
          actions: [
            Center(child: Text(formatId(pokemon.id), style: textStyle)),
            LikeButton(pokemon: pokemon),
          ],
        ),
        body: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
            ),
          ),
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 120),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PokemonDetailSpriteScreen(
                    height: getHeightSize(screenHeight, 30),
                    imageUrl: pokemon.sprites.otherSprites.officialArtwork
                        .officialArtworkUrl),
                PokemonDetailInfoScreen(
                    height: getHeightSize(screenHeight, 55), pokemon: pokemon,
                ),
              ],
            ),
          ),
        ));
  }
}

/*

 */
