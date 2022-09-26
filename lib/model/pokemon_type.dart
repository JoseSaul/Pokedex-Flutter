import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:pokeapi/model/ptype.dart';

part 'pokemon_type.g.dart';

@JsonSerializable()
class PokemonType {

  @JsonKey(name: 'slot')
  int slot;
  @JsonKey(name: 'type')
  PType type;

  PokemonType({required this.slot, required this.type});

  factory PokemonType.fromJson(Map <String, dynamic> json) => _$PokemonTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTypeToJson(this);
}