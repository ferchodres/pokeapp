import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:poke_app/crud/create.dart';
import 'package:poke_app/views/list_view.dart';
import 'package:poke_app/views/splash.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}
// void main() {
//   debugPaintSizeEnabled = false; // Set to true for visual layout
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'material app',
        home: Splash());
  }
}
