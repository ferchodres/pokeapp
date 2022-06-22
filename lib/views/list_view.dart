import 'package:flutter/material.dart';
import 'package:poke_app/entities/search_pokemon.dart';
import 'package:poke_app/views/poke_card.dart';

import '../dominie/coneccion_firebase.dart';
import '../entities/pokelist.dart';

class ListViewPoke extends StatefulWidget {
  const ListViewPoke({Key? key}) : super(key: key);

  @override
  State<ListViewPoke> createState() => _ListViewPoke();
}

class _ListViewPoke extends State<ListViewPoke> {
  final conexion = FirebaseConnection();

  List<Pokemon> pokemon = [];
  @override
  Widget build(BuildContext context) {
    callDatabase();
    return Scaffold(
        appBar: AppBar(
            title: const Text("Pokemon List",
                style: TextStyle(color: Colors.white)),
            actions: <Widget>[
              IconButton(
                  onPressed: () {
                    showSearch(
                        context: context, delegate: SearchPokemon(pokemon));
                  },
                  icon: const Icon(Icons.search))
            ],
            backgroundColor: Colors.red),
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
            padding: const EdgeInsets.all(10),
            itemCount: pokemon.length,
            itemBuilder: (context, index) {
              final item = pokemon[index];
              return Container(
                  //color: Colors.red[50],
                  child: buildPokemon(pokemon[index]));
            }),
        backgroundColor: Colors.red[50]);
  }

  Widget buildPokemon(Pokemon pokemon) => GridTile(
        footer: Text(pokemon.name!,
            textAlign: TextAlign.center, style: const TextStyle(fontSize: 20)),
        child: InkResponse(
            child: Center(
                child: CircleAvatar(
                    radius: 46,
                    backgroundColor: Colors.red,
                    child: CircleAvatar(
                        backgroundImage: Image.network(pokemon.image!).image,
                        radius: 45,
                        backgroundColor: Colors.white))),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PokeCard(pokemon)),
              );
              // AlertDialog alert = AlertDialog(
              //   title: Text(pokemon.name!),
              //   content: Text(pokemon.name!),
              //   actions: <Widget>[
              //     TextButton(
              //       onPressed: () => Navigator.pop(context, 'Cancel'),
              //       child: const Text('Cancel'),
              //     ),
              //     TextButton(
              //       onPressed: () => Navigator.pop(context, 'OK'),
              //       child: const Text('OK'),
              //     ),
              //   ],
              // );
              // showDialog(
              //   context: context,
              //   builder: (BuildContext context) {
              //     return alert;
              //   },
              // );
            }),
      );
  void callDatabase() async {
    final response = await conexion.getAllRegistros();
    if (pokemon.isEmpty) {
      setState(() {
        pokemon = response.pokemons!;
      });
    }
  }
}
