import 'package:json_annotation/json_annotation.dart';

part 'ability_effect.g.dart';

@JsonSerializable()
class AbilityEffect {

  @JsonKey(name: 'effect')
  String description;


  AbilityEffect({
    required this.description,
  });

  factory AbilityEffect.fromJson(Map <String, dynamic> json) => _$AbilityEffectFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityEffectToJson(this);
}