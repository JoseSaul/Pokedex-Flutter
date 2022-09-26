import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/pokemon_card_screen.dart';

final providerPokemon = StateProvider<List<PokemonCardScreen>>((ref) => [] );