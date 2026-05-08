import 'package:transit_track_flutter/apps/admin_app/features/route/domain/entity/stop_entity.dart';

class StopModel extends StopEntity {
  StopModel({
    super.stopId,
    super.stopName,
    super.lat,
    super.lon,
    super.sequence,
    super.distance,
    super.segPloyLine,
  });

  factory StopModel.fromJson(Map<String, dynamic> json) {
    return StopModel();
  }

  Map<String, dynamic> toJson() {
    return {
      "stopId": stopId,
      "stopName": stopName,
      "latitude": lat,
      "longitude": lon,
      "sequence": sequence,
      "segmentPolyline": segPloyLine,
      "distance": distance,
    };
  }
}
