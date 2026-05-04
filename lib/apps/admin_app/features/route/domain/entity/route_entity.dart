import 'package:transit_track_flutter/apps/admin_app/features/route/data/model/stop_model.dart';

class RouteEntity {
  String? routeName;
  String? polyLine;
  bool? isPublic;
  List<StopModel>? stops;

  RouteEntity({this.routeName, this.polyLine, this.isPublic, this.stops});
}
