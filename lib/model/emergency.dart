import 'package:wegesha_client/model/appointment.dart';

class Emergency {
  String id;
  final String userId;
  final String type;
  final String location;
  final String status;
  final String acceptedBy;
  // {
//  "userId": "a5884722-8b8a-420b-987a-b3de810a9990",
//  "type": "Healthcare",
//  "status": "pending",
//  "acceptedBy": "a5884722-8b8a-420b-987a-b3de810a9990",
//  "location": "11.574209,37.361355"
// }
  Emergency({
    this.id = "",
    required this.type,
    required this.location,
    required this.acceptedBy,
    required this.status,
    required this.userId,
  });

  factory Emergency.fromJson(Map<String, dynamic> json) {
    return Emergency(
      id: json['id'],
      type: json['type'],
      location: json['location'],
      status: json['status'],
      userId: json['userId'],
      acceptedBy: json['acceptedBy']
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'location': location,
      'status': status,
      'userId': userId,
      'acceptedBy': acceptedBy
    };
  }
}
