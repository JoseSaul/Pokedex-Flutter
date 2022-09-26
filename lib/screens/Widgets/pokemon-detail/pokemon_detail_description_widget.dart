import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapi/provider/specie_provider.dart';
import 'package:pokeapi/screens/Widgets/pokemon-detail/info_text.dart';

import '../../../model/flavor_text_entries.dart';
import '../../../model/species.dart';
import '../load_screen.dart';

class PokemonDetailDescriptionWidget extends ConsumerStatefulWidget {
  const PokemonDetailDescriptionWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<PokemonDetailDescriptionWidget> createState() =>
      _PokemonDetailDescriptionWidgetState();
}

class _PokemonDetailDescriptionWidgetState
    extends ConsumerState<PokemonDetailDescriptionWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final Species specie = ref.watch(providerSpecie);
      if (specie.flavorText.isEmpty) {
        return const LoadScreen();
      } else {
        FlavorTextEntry text = specie.flavorText.firstWhere((element) => element.version.name == 'emerald');
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoText(title: 'Capture rate: ',text: '${specie.captureRate}'),
            const SizedBox(height: 10),
            InfoText(title: 'Base happiness: ', text: '${specie.baseHappiness}'),
            const SizedBox(height: 20),
            InfoText(text: text.flavorText),
          ],
        );
      }
      })
    );
  }
}
