// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ability_slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbilitySlot _$AbilitySlotFromJson(Map<String, dynamic> json) => AbilitySlot(
      abilityUrl: AbilityUrl.fromJson(json['ability'] as Map<String, dynamic>),
      isHidden: json['is_hidden'] as bool,
    );

Map<String, dynamic> _$AbilitySlotToJson(AbilitySlot instance) =>
    <String, dynamic>{
      'ability': instance.abilityUrl,
      'is_hidden': instance.isHidden,
    };
