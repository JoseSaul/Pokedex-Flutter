import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapi/model/species.dart';

final providerSpecie = StateProvider<Species>((ref) =>
    Species(baseHappiness: 0, captureRate: 0, flavorText: []));