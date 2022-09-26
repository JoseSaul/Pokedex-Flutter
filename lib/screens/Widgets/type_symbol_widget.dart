import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon_type.dart';
import 'package:pokeapi/model/ptype.dart';

class TypeSymbol extends StatelessWidget {
  const TypeSymbol({
    Key? key,
    required this.types
  }) : super(key: key);

  final List<PokemonType> types;

  Widget _getSymbol(PType type) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: type.getColorOfType(),
      ),
      height: 26,
      width: 60,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: Center(
        child: Text(type.name, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (types.length == 2) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getSymbol(types[0].type),
          _getSymbol(types[1].type)
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getSymbol(types[0].type)
        ],
      );
    }


  }


}
