class Appointment {
  String id;
  final String imageUrl;
  final String name;
  final String date;
  final String time;
  final String status;
  final String fieldType;
  final String doctorId;

  Appointment({
    this.id = '',
    required this.imageUrl,
    required this.name,
    required this.date,
    required this.time,
    required this.status,
    required this.fieldType,
    required this.doctorId
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'],
      imageUrl: json['imageUrl'],
      name: json['name'],
      date: json['date'],
      time: json['time'],
      status: json['status'],
      fieldType: json['fieldType'],
      doctorId: json['doctorId']
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
      'doctorId': doctorId
    };
  }
}
