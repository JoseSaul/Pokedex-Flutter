import 'package:json_annotation/json_annotation.dart';
import 'package:pokeapi/model/species_url.dart';
import 'package:pokeapi/model/sprites.dart';

import 'package:pokeapi/model/pokemon_type.dart';

import 'ability_slot.dart';


part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'types')
  List<PokemonType> types;
  @JsonKey(name: 'sprites')
  PokemonSprite sprites;
  @JsonKey(name: 'weight')
  int weight;
  @JsonKey(name: 'height')
  int height;
  @JsonKey(name: 'base_experience')
  int baseExperience;
  @JsonKey(name: 'abilities')
  List<AbilitySlot> abilities;
  @JsonKey(name: 'species')
  SpeciesUrl species;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.sprites,
    required this.weight,
    required this.height,
    required this.baseExperience,
    required this.abilities,
    required this.species,
  });

  factory Pokemon.fromJson(Map <String, dynamic> json) => _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);

  String getName(){
    return '${name[0].toUpperCase()}${name.substring(1).toLowerCase()}';
  }

}