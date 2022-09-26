import 'package:json_annotation/json_annotation.dart';

part 'flavor_text_entry_version.g.dart';

@JsonSerializable()
class FlavorTextEntryVersion {

  @JsonKey(name: 'name')
  String name;


  FlavorTextEntryVersion({
    required this.name,
  });

  factory FlavorTextEntryVersion.fromJson(Map <String, dynamic> json) => _$FlavorTextEntryVersionFromJson(json);

  Map<String, dynamic> toJson() => _$FlavorTextEntryVersionToJson(this);
}