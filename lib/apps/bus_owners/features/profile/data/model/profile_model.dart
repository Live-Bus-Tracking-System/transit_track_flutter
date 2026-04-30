import 'package:transit_track_flutter/apps/admin_app/features/organaization/domain/entity/organaization_entity.dart';

class ProfileModel extends OrganaizationEntity {
  ProfileModel({
    super.id,
    super.name,
    super.email,
    super.phone,
    super.type,
    super.status,
    super.createdAt,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      name: json['name'],
      email: json['normalizedEmail'],
      phone: json['normalizedPhoneNumber'],
      type: json['type'],
      status: json['status'],
      createdAt: json['createdAtUtc'],
    );
  }
}
