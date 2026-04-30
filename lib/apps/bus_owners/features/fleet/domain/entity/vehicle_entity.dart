class VehicleEntity {
  String? id;
  String? orgId;
  String? name;
  String? trackerId;
  String? licensePlt;
  int? capacity;
  bool? isACtive;
  String? createdAt;
  String? createdBy;
  String? lastModAt;
  String? lastModBy;
  String? registrationCertificateUrl;
  String? permitCertificateUrl;
  String? registrationCertificateNo;
  String? permitCertificateNo;
  String? registrationCertIssuedBy;
  String? permitCertIssuedBy;
  String? registrationCertIssuedAt;
  String? permitCertIssuedAt;
  String? registrationCertExpiresAt;
  String? permitCertExpiresAt;
  String? routeName;
  String? startStopName;
  String? endStopName;
  String? additionalNotes;

  VehicleEntity({
    this.id,
    this.orgId,
    this.isACtive,
    this.createdAt,
    this.createdBy,
    this.lastModAt,
    this.lastModBy,
    this.name,
    this.trackerId,
    this.licensePlt,
    this.capacity,
    this.registrationCertificateUrl,
    this.registrationCertificateNo,
    this.registrationCertExpiresAt,
    this.registrationCertIssuedAt,
    this.registrationCertIssuedBy,
    this.permitCertificateUrl,
    this.permitCertificateNo,
    this.permitCertExpiresAt,
    this.permitCertIssuedAt,
    this.permitCertIssuedBy,
    this.routeName,
    this.startStopName,
    this.endStopName,
    this.additionalNotes,
  });
}
