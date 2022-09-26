import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapi/Utils/saved_data.dart';

import '../../model/pokemon.dart';

class LikeButton extends ConsumerStatefulWidget {
  const LikeButton({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  ConsumerState<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends ConsumerState<LikeButton> {

  bool like = false;
  late Icon icon;

  _checkIsFavourite() async{
    if (await SavedData.isFavourite(widget.pokemon)) {
      setState((){
        icon = _likedIcon();
        like = true;
      });
      return;
    }
    like = false;
  }

  @override
  initState() {
    super.initState();
    icon = _unlikedIcon();
    _checkIsFavourite();
  }

  Icon _likedIcon(){
    return const Icon(
      Icons.favorite,
      color: Colors.white,
      size: 40,
    );
  }
  
  Icon _unlikedIcon(){
    return const Icon(
      Icons.favorite_border,
      color: Colors.white,
      size: 40,
    );
  }

  void onClick() async{
      if (like) {
        SavedData.removePokemonFromFavourite(widget.pokemon).then((value) {
          setState(() {
            icon = _unlikedIcon();
            like = false;
          });
        });
      }  else {
        SavedData.addPokemonToFavourite(widget.pokemon).then((value) {
          setState(() {
            icon = _likedIcon();
            like = true;
          });
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GestureDetector(
          onTap: () => onClick(),
          child: icon,
      ),
    );
  }
}
