class AppointmentModel {
  String id;
  final String imageUrl;
  final String name;
  final DateTime date;
  final String time;
  final String status;
  final String location;
  final String fieldType;
  final String doctorId;
  final String patientId;

  AppointmentModel(
      {this.id = '',
      required this.imageUrl,
      required this.name,
      required this.date,
      required this.time,
      required this.status,
      required this.location,
      required this.fieldType,
      required this.patientId,
      required this.doctorId});

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
        id: json['id'],
        imageUrl: json['imageUrl'],
        name: json['name'],
        date: json['date'],
        time: json['time'],
        status: json['status'],
        location: json['location'],
        fieldType: json['fieldType'],
        patientId: json['patientId'],
        doctorId: json['doctorId']);
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
