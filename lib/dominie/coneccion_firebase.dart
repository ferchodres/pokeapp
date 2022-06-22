import 'package:firebase_database/firebase_database.dart';

import '../entities/response_fb.dart';

class FirebaseConnection {
  //devuelve la instancia de la base de datos
  static final FirebaseDatabase _database = FirebaseDatabase.instance;

  DatabaseReference instanceFirebase() {
    return _database.ref('/registros/registros');
  }

  Future<ResponseFirebase> getAllRegistros() async {
    try {
      DatabaseReference _registros = instanceFirebase();
      DataSnapshot response = await _registros.get();
      print('-----------------------------');
      print(response.value);

      final responseMap = response.value as List;
      final pokemons = ResponseFirebase.fromJson(responseMap);
      return pokemons;
    } catch (e) {
      rethrow;
    }
  }
}
