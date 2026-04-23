import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/entity/vehicle_entity.dart';

class VehicleModel extends VehicleEntity {
  VehicleModel({
    required super.name,
    required super.trackerId,
    required super.capacity,
    required super.licensePlt,
    required super.registrationCertificateUrl,
    required super.registrationCertificateNo,
    required super.registrationCertIssuedBy,
    required super.registrationCertIssuedAt,
    required super.registrationCertExpiresAt,
    required super.permitCertificateUrl,
    required super.permitCertificateNo,
    required super.permitCertIssuedBy,
    required super.permitCertIssuedAt,
    required super.permitCertExpiresAt,
    required super.startStopName,
    required super.endStopName,
    required super.routeName,
    required super.additionalNotes,
  });

  Map<String, dynamic> toJson() {
    return {
      "licensePlate": licensePlt,
      "trackerId": trackerId,
      "name": name,
      "capacity": capacity,
      "registrationCertificateUrl": registrationCertificateUrl,
      "permitCertificateUrl": permitCertificateUrl,
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
