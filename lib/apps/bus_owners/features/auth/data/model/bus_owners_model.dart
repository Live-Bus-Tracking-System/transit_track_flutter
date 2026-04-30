import 'package:transit_track_flutter/apps/bus_owners/features/auth/domain/entity/bus_owners_entity.dart';

class BusOwnersModel extends BusOwnersEntity {
  BusOwnersModel({super.id,super.name, super.email, super.phone,super.status, super.type,super.createdAt,super.createdById});

 factory BusOwnersModel.fromJson(Map<String,dynamic> json){
  return BusOwnersModel(
    id: json['id'],
    name: json['name'],
    email: json['normalizedEmail'],
    phone: json['normalizedPhoneNumber'],
    type: json['type'],
    status: json['status'],
    createdAt: json['createdAtUtc'],
    createdById:json['createdBy'] 
  );
 }

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'phoneNumber': phone, 'type': type};
  }
}
