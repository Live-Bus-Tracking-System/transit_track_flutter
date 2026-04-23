part of 'vehicle_bloc.dart';

abstract class VehicleEvent {}

class UploadRegistartionFileEvent extends VehicleEvent{}
class UploadPermitFileEvent extends VehicleEvent{}
class CreateVehicleEvent extends VehicleEvent {
  String name;
  String trackerId;
  String licensePlt;
  int capacity;
  String registrationCertificateUrl;
  String permitCertificateUrl;
  String registrationCertificateNo;
  String permitCertificateNo;
  String registrationCertIssuedBy;
  String permitCertIssuedBy;
  String registrationCertIssuedAt;
  String permitCertIssuedAt;
  String registrationCertExpiresAt;
  String permitCertExpiresAt;
  String routeName;
  String startStopName;
  String endStopName;
  String additionalNotes;
  CreateVehicleEvent({
    required this.name,
    required this.trackerId,
    required this.licensePlt,
    required this.capacity,
    required this.registrationCertificateUrl,
    required this.registrationCertificateNo,
    required this.registrationCertExpiresAt,
    required this.registrationCertIssuedAt,
    required this.registrationCertIssuedBy,
    required this.permitCertificateUrl,
    required this.permitCertificateNo,
    required this.permitCertExpiresAt,
    required this.permitCertIssuedAt,
    required this.permitCertIssuedBy,
    required this.routeName,
    required this.startStopName,
    required this.endStopName,
    required this.additionalNotes,
  });
}
