// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      id: json['id'] as int,
      name: json['name'] as String,
      types: (json['types'] as List<dynamic>)
          .map((e) => PokemonType.fromJson(e as Map<String, dynamic>))
          .toList(),
      sprites: PokemonSprite.fromJson(json['sprites'] as Map<String, dynamic>),
      weight: json['weight'] as int,
      height: json['height'] as int,
      baseExperience: json['base_experience'] as int,
      abilities: (json['abilities'] as List<dynamic>)
          .map((e) => AbilitySlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      species: SpeciesUrl.fromJson(json['species'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'types': instance.types,
      'sprites': instance.sprites,
      'weight': instance.weight,
      'height': instance.height,
      'base_experience': instance.baseExperience,
      'abilities': instance.abilities,
      'species': instance.species,
    };
