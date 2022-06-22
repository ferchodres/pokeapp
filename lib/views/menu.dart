import 'package:flutter/material.dart';
import 'package:poke_app/views/profiles.dart';
import 'dart:math';

import 'home.dart';
import 'list_view.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuS createState() => _MenuS();
}

class _MenuS extends State<Menu> {
  int _selectedIndex = 0;

  static const TextStyle optionsStyle =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    ListViewPoke(),
    Profile(),
  ];
  Color _tema2 = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  void _onTimeTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _tema2 = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.list, color: Colors.white),
            label: 'PokeList',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.people, color: Colors.white), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onTimeTapped,
        backgroundColor: Colors.red,
      ),
    );
  }
}
