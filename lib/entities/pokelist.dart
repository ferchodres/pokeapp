import 'package:poke_app/entities/statistics.dart';

class Pokemon {
  final String? name;
  final String? image;
  final List? type;
  final Statistics? statistics;
  final String? description;
  final List? weaknesses;
  final double? weight;
  final double? height;

  Pokemon(
      {this.name,
      this.image,
      this.type,
      this.statistics,
      this.description,
      this.weaknesses,
      this.weight,
      this.height});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
        name: json['name'],
        image: json['image'],
        type: json['type'],
        statistics: json['statistics'] != null
            ? Statistics.fromJson(
                Map<String, dynamic>.from(json['statistics'] as Map))
            : null,
        description: json['description'],
        weight: json['weight'],
        height: json['height'],
        weaknesses: json['weaknesses']);
  }
}
