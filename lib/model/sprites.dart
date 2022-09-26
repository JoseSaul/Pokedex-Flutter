import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:pokeapi/model/sprites_other.dart';

part 'sprites.g.dart';

@JsonSerializable()
class PokemonSprite {

  @JsonKey(name: 'front_default')
  String spriteUrl;
  @JsonKey(name: 'other')
  PokemonSpritesOther otherSprites;

  PokemonSprite({required this.spriteUrl, required this.otherSprites});

  factory PokemonSprite.fromJson(Map <String, dynamic> json) => _$PokemonSpriteFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpriteToJson(this);
}