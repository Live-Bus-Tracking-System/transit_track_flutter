import 'package:transit_track_flutter/apps/bus_owners/features/route/domain/entity/stop_entity.dart';

class StopModel extends StopEntity {
  StopModel({
    required super.name,
    required super.lat,
    required super.lon,
    required super.isGlobal,
  });

  factory StopModel.fromJson(Map<String, dynamic> json) {
    return StopModel(
      name: json[''],
      lat: json[''],
      lon: json[''],
      isGlobal: json[''],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "stopName": name,
      "latitude": lat,
      "logtitude": lon,
      "isGlobal": isGlobal,
    };
  }
}
