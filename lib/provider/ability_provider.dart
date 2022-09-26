import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapi/model/ability.dart';

final providerAbility = StateProvider<List<Ability>>((ref) => []);