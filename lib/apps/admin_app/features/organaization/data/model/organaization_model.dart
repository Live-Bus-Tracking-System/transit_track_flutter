import 'package:transit_track_flutter/apps/admin_app/features/organaization/domain/entity/organaization_entity.dart';

class OrganaizationModel extends OrganaizationEntity {
  OrganaizationModel({
    super.id,
    super.name,
    super.email,
    super.phone,
    super.type,
    super.status,
    super.createdAt,
  });

  factory OrganaizationModel.fromJson(Map<String, dynamic> json) {
    return OrganaizationModel(
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
