import 'package:poke_app/entities/pokelist.dart';

class ResponseFirebase {
  List<Pokemon>? pokemons;

  ResponseFirebase({
    this.pokemons,
  });

  ResponseFirebase.fromJson(List<dynamic> json) {
    pokemons = json
        .map((e) => Pokemon.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }
}
