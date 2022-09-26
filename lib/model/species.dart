import 'package:json_annotation/json_annotation.dart';

import 'flavor_text_entries.dart';

part 'species.g.dart';

@JsonSerializable()
class Species {

  @JsonKey(name: 'base_happiness')
  int baseHappiness;
  @JsonKey(name: 'capture_rate')
  int captureRate;
  @JsonKey(name: 'flavor_text_entries')
  List<FlavorTextEntry> flavorText;


  Species({
    required this.baseHappiness,
    required this.captureRate,
    required this.flavorText,
  });

  factory Species.fromJson(Map <String, dynamic> json) => _$SpeciesFromJson(json);

  Map<String, dynamic> toJson() => _$SpeciesToJson(this);
}