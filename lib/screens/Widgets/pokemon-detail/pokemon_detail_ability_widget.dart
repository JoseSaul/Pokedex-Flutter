import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapi/Screens/Widgets/load_screen.dart';
import 'package:pokeapi/screens/Widgets/pokemon-detail/info_text.dart';

import '../../../model/ability.dart';
import '../../../model/ability_slot.dart';
import '../../../provider/ability_provider.dart';

class PokemonDetailAbilityScreen extends ConsumerStatefulWidget {
  const PokemonDetailAbilityScreen({
    Key? key,
    required this.abilitySlot,
  }) : super(key: key);

  final List<AbilitySlot> abilitySlot;

  @override
  ConsumerState<PokemonDetailAbilityScreen> createState() => _PokemonDetailAbilityScreenState();
}

class _PokemonDetailAbilityScreenState extends ConsumerState<PokemonDetailAbilityScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final List<Ability> abilities = ref.watch(providerAbility);
          List<Widget> result = [];
          for (var element in widget.abilitySlot) {
            Ability description = abilities.firstWhere((e) => e.name == element.abilityUrl.name, orElse: () => Ability(effect: [], name: ''));
            if (description.effect.isNotEmpty){
              result.add(Column(
                children: [
                  Row(
                    children: [
                      InfoText(title: element.abilityUrl.name),
                      InfoText(text: element.isHidden? ' (Hidden)' : ''),
                    ],
                  ),
                  const SizedBox(height: 10),
                  InfoText(text: description.effect[1].description),
                  const SizedBox(height: 30),
                ],
              ));
            }
          }

          if (result.isEmpty) {
            return const LoadScreen();
          }
          return Scrollbar(
              thumbVisibility: false,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 0),
                itemCount: 1,
                itemBuilder: (context, index) => Column(children: result),
              ),
          );
        });
  }
}
