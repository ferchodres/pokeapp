import 'package:flutter/material.dart';
import 'package:poke_app/entities/pokelist.dart';

import '../views/poke_card.dart';

class SearchPokemon extends SearchDelegate<Pokemon> {
  final List<Pokemon> pokemon;
  List<Pokemon> _filtrar = [];
  SearchPokemon(this.pokemon);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, Pokemon());
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
        itemCount: _filtrar.length,
        itemBuilder: (_, index) {
          return ListTile(
            title: Text(_filtrar[index].name!),
            leading: CircleAvatar(
                backgroundImage: Image.network(_filtrar[index].image!).image,
                backgroundColor: Colors.white),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PokeCard(_filtrar[index])),
              );
            },
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _filtrar = pokemon.where((pokemon) {
      return pokemon.name!.toLowerCase().contains(query.trim().toLowerCase());
    }).toList();
    return ListView.builder(
        itemCount: _filtrar.length,
        itemBuilder: (_, index) {
          return ListTile(
            title: Text(_filtrar[index].name!),
            leading: CircleAvatar(
                backgroundImage: Image.network(_filtrar[index].image!).image,
                backgroundColor: Colors.white),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PokeCard(_filtrar[index])),
              );
            },
          );
        });
  }
}
