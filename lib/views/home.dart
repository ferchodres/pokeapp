import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';
import 'package:poke_app/crud/create.dart';
import 'package:poke_app/views/profiles.dart';

import 'list_view.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> pokemon = [
      {
        "image": "https://assets.puzzlefactory.com/puzzle/420/180/original.jpg",
        "name": "List"
      },
      {
        "image":
            "https://static.wikia.nocookie.net/espokemon/images/a/a5/Pok%C3%A9dex_DPP.png/revision/latest?cb=20141118021041",
        "name": "Create"
      },
      {
        "image":
            "https://i.pinimg.com/originals/18/d9/e1/18d9e1307018dbc76750ca7d5124fccd.png",
        "name": "Profile"
      },
    ];
    return MaterialApp(
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(title: Text('PokeApp'), backgroundColor: Colors.red),
          body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                childAspectRatio: 0.7,
                crossAxisSpacing: 8,
              ),
              padding: const EdgeInsets.all(30),
              itemCount: pokemon.length,
              itemBuilder: (context, index) {
                final item = pokemon[index];
                return Container(
                    //color: Colors.red[50],
                    child: GridTile(
                  header: Text(
                    pokemon[index]["name"]!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Avatar(
                          sources: [NetworkSource(pokemon[index]["image"]!)],
                          onTap: () {
                            if (pokemon[index]["name"] == 'List') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ListViewPoke()),
                              );
                            }
                            if (pokemon[index]["name"] == 'Create') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CreateView()),
                              );
                            }
                            if (pokemon[index]["name"] == 'Profile') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Profile()),
                              );
                            }
                          })),
                ));
              }),
        ));
  }
}
