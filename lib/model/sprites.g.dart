// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sprites.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonSprite _$PokemonSpriteFromJson(Map<String, dynamic> json) =>
    PokemonSprite(
      spriteUrl: json['front_default'] as String,
      otherSprites:
          PokemonSpritesOther.fromJson(json['other'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonSpriteToJson(PokemonSprite instance) =>
    <String, dynamic>{
      'front_default': instance.spriteUrl,
      'other': instance.otherSprites,
    };
