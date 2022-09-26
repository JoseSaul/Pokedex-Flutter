import 'package:json_annotation/json_annotation.dart';

import 'ability_url.dart';

part 'ability_slot.g.dart';

@JsonSerializable()
class AbilitySlot {

  @JsonKey(name: 'ability')
  AbilityUrl abilityUrl;
  @JsonKey(name: 'is_hidden')
  bool isHidden;


  AbilitySlot({
    required this.abilityUrl,
    required this.isHidden,
  });

  factory AbilitySlot.fromJson(Map <String, dynamic> json) => _$AbilitySlotFromJson(json);

  Map<String, dynamic> toJson() => _$AbilitySlotToJson(this);
}