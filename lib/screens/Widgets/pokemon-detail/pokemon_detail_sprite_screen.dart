import 'package:flutter/material.dart';

class PokemonDetailSpriteScreen extends StatelessWidget {
  const PokemonDetailSpriteScreen({
    Key? key,
    required this.height,
    required this.imageUrl,
  }) : super(key: key);

  final double height;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/pokeball_background1.png'),
          colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.6), BlendMode.dstOut),
          fit: BoxFit.cover,
        ),
      ),
      child: FadeInImage(
          width: height - 10,
          height: height,
          fit: BoxFit.fill,
          placeholder: const AssetImage('assets/Loading.gif') ,
          image: NetworkImage(imageUrl)
      ),
    );
  }
}
