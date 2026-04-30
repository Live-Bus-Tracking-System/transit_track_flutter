import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/entity/vehicle_entity.dart';

class VehicleModel extends VehicleEntity {
  VehicleModel({
    super.id,
    super.orgId,
    super.isACtive,
    super.createdAt,
    super.createdBy,
    super.lastModAt,
    super.lastModBy,
    super.name,
    super.trackerId,
    super.capacity,
    super.licensePlt,
    super.registrationCertificateUrl,
    super.registrationCertificateNo,
    super.registrationCertIssuedBy,
    super.registrationCertIssuedAt,
    super.registrationCertExpiresAt,
    super.permitCertificateUrl,
    super.permitCertificateNo,
    super.permitCertIssuedBy,
    super.permitCertIssuedAt,
    super.permitCertExpiresAt,
    super.startStopName,
    super.endStopName,
    super.routeName,
    super.additionalNotes,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      id: json['id'],
      orgId: json['organisationId'],
      trackerId: json['trackerId'],
      licensePlt: json['licensePlate'],
      name: json['name'],
      capacity: json['capacity'],
      isACtive: json['isActive'],
      createdAt: json['createdAtUtc'],
      createdBy: json['createdBy'],
      lastModAt: json['lastModifiedAtUtc'],
      lastModBy: json['lastModifiedBy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "licensePlate": licensePlt,
      "trackerId": trackerId,
      "name": name,
      "capacity": capacity,
      "registrationCertificateKey": registrationCertificateUrl,
      "permitCertificateKey": permitCertificateUrl,
      "registrationCertificateNumber": registrationCertificateNo,
      "permitCertificateNumber": permitCertificateNo,
      "registrationCertIssuedBy": registrationCertIssuedBy,
      "permitCertIssuedBy": permitCertIssuedBy,
      "registrationCertIssuedAt": registrationCertIssuedAt,
      "registrationCertExpiresAt": registrationCertExpiresAt,
      "permitCertIssuedAt": permitCertIssuedAt,
      "permitCertExpiresAt": permitCertExpiresAt,
      "intendedRouteName": routeName,
      "startStopName": startStopName,
      "endStopName": endStopName,
      "additionalNotes": additionalNotes,
    };
  }
}
