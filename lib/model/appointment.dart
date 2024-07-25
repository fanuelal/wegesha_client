class AppointmentModel {
  String id;
  String imageUrl;
  final String name;
  final DateTime date;
  final String time;
  String status;
  final String location;
  final String fieldType;
  final String doctorId;
  final String patientId;
  String notes;

  AppointmentModel(
      {this.id = '',
      this.imageUrl = '',
      required this.name,
      required this.date,
      required this.time,
      required this.status,
      required this.location,
      required this.fieldType,
      required this.patientId,
      required this.doctorId,
      this.notes = ''});

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    print(json);
    print(json['profilePicture'] == '');
    return AppointmentModel(
        id: json['id']?.toString() ?? '',
        imageUrl: json['profilePicture'] ?? '',
        name:
            '${json['firstName']} ${json['lastName']}' ??
                '',
        date: DateTime.parse(json['dateTime']),
        time: json['dateTime'] ?? '',
        status: json['status'] ?? '',
        location: json['UserLocation'] ?? '',
        fieldType: json['fieldType'] ?? '',
        patientId: json['patientId'] ?? '',
        doctorId: json['doctorId'] ?? '',
        notes: json['notes'] ?? '');
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'name': name,
      'date': date.toIso8601String(),
      'time': time,
      'status': status,
      'location': location,
      'fieldType': fieldType,
      'patientId': patientId,
      'doctorId': doctorId,
      'notes': notes
    };
  }
}
