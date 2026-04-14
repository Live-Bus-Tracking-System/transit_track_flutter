import 'package:transit_track_flutter/apps/bus_owners/features/route/domain/entity/place_dtls.dart';

class PlaceDtlsModel extends PlaceDtls {
  PlaceDtlsModel({
    required super.road,
    required super.village,
    required super.county,
    required super.district,
    required super.state,
  });

  factory PlaceDtlsModel.fromJson(Map<String, dynamic> json) {
    return PlaceDtlsModel(
      road: json['address']['road'],
      village: json['address']['village'],
      county: json['address']['county'],
      district: json['address']['state_district'],
      state: json['address']['state'],
    );
  }
}
