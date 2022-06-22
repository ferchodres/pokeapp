import 'dart:ffi';

class Pokemon{
  final int id;
  final String name;
  final String description;
  final String generation;
  final Array element;

  Pokemon({required this.id, 
          required this.name, 
          required this.description, 
          required this.generation, 
          required this. element});
  
  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'name': name,
      'description': description,
      'generation': generation,
      'element': element
    };
  }
  
}