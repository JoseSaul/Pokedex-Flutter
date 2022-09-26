import 'package:json_annotation/json_annotation.dart';

import 'ability_effect.dart';

part 'ability.g.dart';

@JsonSerializable()
class Ability {

  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'effect_entries')
  List<AbilityEffect> effect;



  Ability({
    required this.effect,
    required this.name,
  });

  factory Ability.fromJson(Map <String, dynamic> json) => _$AbilityFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityToJson(this);
}