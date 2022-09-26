import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:pokeapi/model/sprite_official-artwork.dart';

part 'sprites_other.g.dart';

@JsonSerializable()
class PokemonSpritesOther {

  @JsonKey(name: 'official-artwork')
  PokemonSpriteOfficialArtwork officialArtwork;

  PokemonSpritesOther({required this.officialArtwork});

  factory PokemonSpritesOther.fromJson(Map <String, dynamic> json) => _$PokemonSpritesOtherFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpritesOtherToJson(this);
}