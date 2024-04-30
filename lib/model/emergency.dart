class Emergency {
  final int id;
  final String type;
  final String location;
  final String description;

  Emergency({
    required this.id,
    required this.type,
    required this.location,
    required this.description,
  });

  factory Emergency.fromJson(Map<String, dynamic> json) {
    return Emergency(
      id: json['id'],
      type: json['type'],
      location: json['location'],
      description: json['description'],
    );
  }
    Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'location': location,
      'description': description,
    };
  }
}
