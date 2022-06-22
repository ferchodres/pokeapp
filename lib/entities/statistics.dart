class Statistics {
  final int? attack;
  final int? defense;
  final int? velocity;

  Statistics({this.attack, this.defense, this.velocity});

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      attack: json['attack'],
      defense: json['defense'],
      velocity: json['velocity'],
    );
  }
}
