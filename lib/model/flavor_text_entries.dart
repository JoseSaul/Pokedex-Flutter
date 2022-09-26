import 'package:json_annotation/json_annotation.dart';

import 'flavor_text_entry_version.dart';

part 'flavor_text_entries.g.dart';

@JsonSerializable()
class FlavorTextEntry {

  @JsonKey(name: 'flavor_text')
  String flavorText;
  @JsonKey(name: 'version')
  FlavorTextEntryVersion version;


  FlavorTextEntry({
    required this.flavorText,
    required this.version,
  });

  factory FlavorTextEntry.fromJson(Map <String, dynamic> json) => _$FlavorTextEntryFromJson(json);

  Map<String, dynamic> toJson() => _$FlavorTextEntryToJson(this);
}