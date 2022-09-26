import 'package:json_annotation/json_annotation.dart';

part 'ability_url.g.dart';

@JsonSerializable()
class AbilityUrl {

  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'url')
  String url;

  AbilityUrl({
    required this.name,
    required this.url,
  });

  factory AbilityUrl.fromJson(Map <String, dynamic> json) => _$AbilityUrlFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityUrlToJson(this);

  int getId(){
    String id = url.replaceAll('https://pokeapi.co/api/v2/ability/', '').replaceAll('/', '');
    return int.parse(id);
  }

}