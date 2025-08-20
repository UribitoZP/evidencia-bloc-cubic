class Modelo {
  final int id;
  final String name;

  Modelo({required this.id, required this.name});

  factory Modelo.fromJson(Map<String, dynamic> json) {
    return Modelo(
      id: json['id'],
      name: json['name'],
    );
  }
}
