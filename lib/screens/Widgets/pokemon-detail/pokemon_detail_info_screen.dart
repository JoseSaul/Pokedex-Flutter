import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapi/model/ability_slot.dart';
import 'package:pokeapi/provider/ability_provider.dart';
import 'package:pokeapi/provider/net_provider.dart';
import 'package:pokeapi/provider/specie_provider.dart';
import 'package:pokeapi/screens/Widgets/pokemon-detail/info_text.dart';
import 'package:pokeapi/screens/Widgets/pokemon-detail/pokemon_detail_ability_widget.dart';
import 'package:pokeapi/screens/Widgets/pokemon-detail/pokemon_detail_description_widget.dart';
import 'package:tab_container/tab_container.dart';

import '../../../model/ability.dart';
import '../../../model/pokemon.dart';
import '../type_symbol_widget.dart';

class PokemonDetailInfoScreen extends ConsumerStatefulWidget {
  const PokemonDetailInfoScreen({
    Key? key,
    required this.height,
    required this.pokemon,
  }) : super(key: key);

  final double height;
  final Pokemon pokemon;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PokemonDetailInfoScreenState();
}

class _PokemonDetailInfoScreenState
    extends ConsumerState<PokemonDetailInfoScreen> {

  @override
  initState(){
    super.initState();
    _loadAbility();
    _loadSpecie();
  }

  _loadAbility() async {
    List<Ability> abilities = [];
    await Future.forEach(widget.pokemon.abilities, (AbilitySlot element) async {
      abilities.add(
          await ref.read(providerApi).getAbility(element.abilityUrl.getId()));
    }).then((value) => ref.read(providerAbility.state).state = abilities);
  }

  _loadSpecie() async {
    ref.refresh(providerSpecie.state).state =
        await ref.read(providerApi).getPokemonSpecie(widget.pokemon.id);
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: widget.height,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.white30,
      ),
      child: TabContainer(
        tabs: const ['About', 'Ability', 'Description'],
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              TypeSymbol(types: widget.pokemon.types),
              const SizedBox(height: 20),
              InfoText(text: 'Height: ${widget.pokemon.height}'),
              const SizedBox(height: 10),
              InfoText(text: 'Weight: ${widget.pokemon.weight}'),
              const SizedBox(height: 10),
              InfoText(text: 'Base experience: ${widget.pokemon.baseExperience}'),
            ],
          ),
          PokemonDetailAbilityScreen(abilitySlot: widget.pokemon.abilities),
          const PokemonDetailDescriptionWidget(),
        ],
      ),
    );
  }
}
