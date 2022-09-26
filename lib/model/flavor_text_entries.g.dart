// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flavor_text_entries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlavorTextEntry _$FlavorTextEntryFromJson(Map<String, dynamic> json) =>
    FlavorTextEntry(
      flavorText: json['flavor_text'] as String,
      version: FlavorTextEntryVersion.fromJson(
          json['version'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FlavorTextEntryToJson(FlavorTextEntry instance) =>
    <String, dynamic>{
      'flavor_text': instance.flavorText,
      'version': instance.version,
    };
