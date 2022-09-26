import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/pokemon.dart';
import '../provider/net_provider.dart';
import '../screens/pokemon_card_screen.dart';

class PokemonRepository {

  static Future<List<PokemonCardScreen>> getPokemonCards(WidgetRef ref, int firstId, int lastId) async{
    List<PokemonCardScreen> pokemonList = <PokemonCardScreen>[];
    for(int i = firstId; i <= lastId ; i++) {
      Pokemon pokemon = await ref.read(providerApi).getPokemonList(i);
      pokemonList.add(PokemonCardScreen(pokemon: pokemon));
    }

    return pokemonList;
  }

}