import 'dart:convert';

import 'package:pokeapi/model/pokemon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedData {

  static Future<List<Pokemon>> getSavedPokemon() async {
    final shared = await SharedPreferences.getInstance();
    List<Pokemon> pokemonList = [];
    List<String> pokemonEncoded = shared.getStringList('pokemon_list') ?? [];
    for (var element in pokemonEncoded){
      pokemonList.add(Pokemon.fromJson(jsonDecode(element)));
    }
    return pokemonList;
  }

  static Future<void> addPokemonToFavourite(Pokemon pokemon) async {
    final shared = await SharedPreferences.getInstance();
    List<Pokemon> pokemonList = await getSavedPokemon();
    pokemonList.add(pokemon);
    List<String> result = [];
    for (var element in pokemonList){
      result.add(jsonEncode(element));
    }
    await shared.setStringList('pokemon_list', result);
  }

  static Future<void> removePokemonFromFavourite(Pokemon pokemon) async{
    final shared = await SharedPreferences.getInstance();
    List<Pokemon> pokemonList = await getSavedPokemon();
    pokemonList.removeWhere((element) => element.id == pokemon.id);
    List<String> result = [];
    for (var element in pokemonList){
      result.add(jsonEncode(element));
    }
    await shared.setStringList('pokemon_list', result);
  }

  static Future<bool> isFavourite(Pokemon pokemon) async{
    List<Pokemon> pokemonList = await getSavedPokemon();
    for (var element in pokemonList){
      if (element.id == pokemon.id) return true;
    }
    return false;
  }

}