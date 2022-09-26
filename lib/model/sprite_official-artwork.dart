import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'sprite_official-artwork.g.dart';

@JsonSerializable()
class PokemonSpriteOfficialArtwork {

  @JsonKey(name: 'front_default')
  String officialArtworkUrl;

  PokemonSpriteOfficialArtwork({required this.officialArtworkUrl});

  factory PokemonSpriteOfficialArtwork.fromJson(Map <String, dynamic> json) => _$PokemonSpriteOfficialArtworkFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpriteOfficialArtworkToJson(this);
}