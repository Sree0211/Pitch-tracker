class MatchModel {
  final int? id;
  final String name;
  final String date;
  final String opponent;
  final String formation;

  MatchModel({
    this.id,
    required this.name,
    required this.date,
    required this.opponent,
    required this.formation,
  });

  factory MatchModel.fromJson(Map<String, dynamic> json) {
    return MatchModel(
      id: json['id'],
      name: json['name'],
      date: json['date'],
      opponent: json['opponent'],
      formation: json['formation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'date': date,
      'opponent': opponent,
      'formation': formation,
    };
  }
}
