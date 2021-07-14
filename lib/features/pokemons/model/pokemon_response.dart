import 'package:flutter_training/features/pokemons/model/pokemon.dart';

class PokemonResponse {
  PokemonResponse(this.pokemons, this.isLast, this.next);

  final List<Pokemon> pokemons;
  final bool isLast;
  final String next;

  factory PokemonResponse.fromMap(Map<String, dynamic> json) {
      final List<Pokemon> pokemons = json['results'].map<Pokemon>((e) => Pokemon.fromMap(e)).toList();
      final next = json['next'];
      final isLastPage = next == null;
      return PokemonResponse(pokemons, isLastPage, next);
  }
}