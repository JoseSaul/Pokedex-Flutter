import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ptype.g.dart';

@JsonSerializable()
class PType {

  @JsonKey(name: 'name')
  String name;

  PType({required this.name});

  factory PType.fromJson(Map <String, dynamic> json) => _$PTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PTypeToJson(this);

  Color getColorOfType(){
    switch (name) {
      case 'normal': return Colors.brown.shade100;
      case 'fighting': return Colors.deepOrangeAccent.shade400;
      case 'flying': return Colors.indigoAccent.shade400;
      case 'poison': return Colors.purpleAccent;
      case 'ground': return Colors.orange.shade200;
      case 'rock': return Colors.brown.shade200;
      case 'bug': return Colors.lightGreen;
      case 'ghost': return Colors.deepPurple;
      case 'steel': return Colors.blue.shade100;
      case 'fire': return Colors.deepOrangeAccent;
      case 'water': return Colors.blue.shade300;
      case 'grass': return Colors.green.shade400;
      case 'electric': return Colors.amberAccent;
      case 'psychic': return Colors.pinkAccent;
      case 'ice': return Colors.cyan.shade100;
      case 'dragon': return Colors.indigo;
      case 'dark': return Colors.black38;
      case 'fairy': return Colors.pinkAccent.shade100;

      default: return Colors.transparent;
    }
  }

}