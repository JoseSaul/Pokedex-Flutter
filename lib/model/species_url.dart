import 'package:json_annotation/json_annotation.dart';

part 'species_url.g.dart';

@JsonSerializable()
class SpeciesUrl {

  @JsonKey(name: 'url')
  String url;


  SpeciesUrl({
    required this.url,
  });

  factory SpeciesUrl.fromJson(Map <String, dynamic> json) => _$SpeciesUrlFromJson(json);

  Map<String, dynamic> toJson() => _$SpeciesUrlToJson(this);
}