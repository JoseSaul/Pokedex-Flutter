import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapi/Repository/pokemon_repository.dart';
import 'package:pokeapi/provider/pokemon_provider.dart';
import 'package:pokeapi/screens/Widgets/title_widget.dart';
import 'package:pokeapi/screens/pokemon_card_screen.dart';

import 'Widgets/load_screen.dart';

class PokedexScreen extends ConsumerStatefulWidget {
  const PokedexScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends ConsumerState<PokedexScreen> {

  late ScrollController _controller;
  double scrollReach = 0;
  bool canLoad = true;

  @override
  void initState() {
    super.initState();
    PokemonRepository.getPokemonCards(ref, 1, 30)
        .then((value) {
          ref.read(providerPokemon.notifier).state = value;
        });
    _controller = ScrollController();
    _controller.addListener(scrollController);
  }

  scrollController() {
    if (_controller.offset >= scrollReach && canLoad) {
      canLoad = false;
      int length = ref.read(providerPokemon.state).state.length;
      int last = length + 30;
      if (last >= 386) last = 386;
      PokemonRepository.getPokemonCards(ref, length + 1, last).then((value) {
        ref.read(providerPokemon.notifier).state += value;
        scrollReach = _controller.position.maxScrollExtent -1500;
        canLoad = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final List<PokemonCardScreen> pokedex = ref.watch(providerPokemon);
          if (ref.read(providerPokemon).isEmpty) {
            return const LoadScreen();
          } else {
            int crossAxisCount = (MediaQuery.of(context).size.width / 200).round();
            return Container(
              color: Colors.white,
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  const TitleWidget(title: 'Pokedex'),
                  Expanded(
                    child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(8),
                      controller: _controller,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                      crossAxisCount: crossAxisCount,
                      children: pokedex,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
