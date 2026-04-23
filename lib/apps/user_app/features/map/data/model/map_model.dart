import 'package:transit_track_flutter/apps/user_app/features/map/domain/entites/map_types.dart';

class MapModel extends MapTypes{
  MapModel({
    required super.lag,
    required super.lat,
    required super.from,
    required super.to
  });
  factory MapModel.fromjson(Map<String,dynamic>fromJson){
    return MapModel(lag: fromJson["lag"], lat: fromJson["lat"], from: fromJson["from"], to: fromJson["to"]);
  }

  Map<String,dynamic>toMap(){
    return {
      "lag":lag,
      "lat":lat,
      "from":from,
      "to":to
    };
  }
}