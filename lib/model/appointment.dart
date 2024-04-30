class Appointment {
  final String imageUrl;
  final String name;
  final String date;
  final String time;
  final String status;
  final String fieldType;

  Appointment({
    required this.imageUrl,
    required this.name,
    required this.date,
    required this.time,
    required this.status,
    required this.fieldType,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      imageUrl: json['imageUrl'],
      name: json['name'],
      date: json['date'],
      time: json['time'],
      status: json['status'],
      fieldType: json['fieldType'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'name': name,
      'date': date,
      'time': time,
      'status': status,
      'fieldType': fieldType,
    };
  }
}