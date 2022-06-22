import 'package:flutter/material.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/getwidget.dart';

import '../entities/pokelist.dart';

class PokeCard extends StatelessWidget {
  final Pokemon pokemon;
  final Map<String, Color> colores = {
    "electrico": Colors.amber,
    "fuego": Colors.red,
    "planta": Colors.green,
    "veneno": Colors.purple,
    "psiquico": Colors.pink,
    "fantasma": Color.fromARGB(255, 203, 113, 219),
    "siniestro": Colors.grey,
    "bicho": Color.fromARGB(255, 128, 187, 79),
    "agua": Colors.blue,
    "normal": Color.fromARGB(255, 223, 182, 167),
    "volador": Color.fromARGB(255, 113, 159, 240),
    "hielo": Color.fromARGB(255, 35, 243, 243),
    "roca": Colors.brown,
    "tierra": Color.fromARGB(255, 216, 89, 43),
    "acero": Colors.grey,
    "lucha": Color.fromARGB(255, 255, 123, 0),
    "hada": Color.fromARGB(255, 238, 105, 149)
  };
  PokeCard(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text(pokemon.name!, style: const TextStyle(color: Colors.white)),
          backgroundColor: Colors.red,
        ),
        body: Column(children: [
          GFCard(
            boxFit: BoxFit.cover,
            titlePosition: GFPosition.start,
            image: Image.network(
              pokemon.image!,
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            showImage: true,
            content: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(pokemon.description!, textAlign: TextAlign.justify),
                  const Text(''),
                  const Text('Type: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.right),
                  GFButtonBar(
                    children: <Widget>[
                      Chip(
                        padding: EdgeInsets.all(0),
                        backgroundColor: colores[pokemon.type?[0]],
                        label: Text(pokemon.type?[0],
                            style: TextStyle(color: Colors.white)),
                      ),
                      if (pokemon.type?.length == 2)
                        Chip(
                          padding: EdgeInsets.all(0),
                          backgroundColor: colores[pokemon.type?[1]],
                          label: Text(pokemon.type?[1],
                              style: TextStyle(color: Colors.white)),
                        ),
                    ],
                  ),
                  const Text('weaknesses: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.right),
                  GFButtonBar(
                    children: <Widget>[
                      for (int i = 0; i < pokemon.weaknesses!.length; i++)
                        Chip(
                          padding: EdgeInsets.all(0),
                          backgroundColor: colores[pokemon.weaknesses?[i]],
                          label: Text(pokemon.weaknesses?[i],
                              style: TextStyle(color: Colors.white)),
                        ),
                    ],
                  ),
                  Text(
                    'Height: ' +
                        pokemon.weight!.toString() +
                        'mts  ' +
                        'Weight: ' +
                        pokemon.height!.toString() +
                        'kg',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  const Text(''),
                  const Text('Statitics: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.right),
                  Text(
                    'ATT: ' +
                        pokemon.statistics!.attack.toString() +
                        '  ' +
                        'DEF: ' +
                        pokemon.statistics!.defense.toString() +
                        '  '
                            'VEL: ' +
                        pokemon.statistics!.velocity.toString() +
                        '  ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ]),
          ),
        ]));
  }
}
