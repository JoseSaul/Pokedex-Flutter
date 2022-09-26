import 'package:dio/dio.dart';
import 'package:pokeapi/model/ability.dart';
import 'package:pokeapi/model/species.dart';
import 'package:retrofit/http.dart';

import '../model/pokemon.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://pokeapi.co/api/v2')
abstract class ApiClient{
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/pokemon/{id}')
  Future<Pokemon> getPokemonList(@Path('id') int pokemonId);

  @GET('/ability/{id}')
  Future<Ability> getAbility(@Path('id') int abilityId);

  @GET('/pokemon-species/{id}')
  Future<Species> getPokemonSpecie(@Path('id') int pokemonId);
}

