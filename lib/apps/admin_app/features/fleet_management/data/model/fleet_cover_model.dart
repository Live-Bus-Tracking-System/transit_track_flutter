import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/domain/entity/fleet_cover_entity.dart';

class FleetCoverModel extends FleetCoverEntity {
  FleetCoverModel({
    super.id,
    super.name,
    super.orgId,
    super.capacity,
    super.licensePlt,
    super.createdAt,
    super.isActive,
  });

  factory FleetCoverModel.fromJson(Map<String, dynamic> json) {
    return FleetCoverModel(
      id: json['id'],
      orgId: json['organisationId'],
      name: json['name'],
      capacity: json['capacity'],
      licensePlt: json['licensePlt'],
      isActive: json['isActive'],
      createdAt: json['createdAt'],
    );
  }
}
