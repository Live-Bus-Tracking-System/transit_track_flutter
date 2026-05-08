import 'package:transit_track_flutter/apps/admin_app/features/route/domain/entity/route_entity.dart';

class RouteModel extends RouteEntity {
  RouteModel({super.routeName, super.polyLine, super.isPublic, super.stops});

  factory RouteModel.fromJson(Map<String, dynamic> json) {
    return RouteModel();
  }

  Map<String, dynamic> toJson() {
    return {
      "routeNumber": routeName,
      "fullPolyline": polyLine,
      "isPublic": isPublic,
      "stops": stops?.map((e) => e.toJson()).toList(),
    };
  }
}
