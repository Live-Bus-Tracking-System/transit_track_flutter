part of 'route_bloc.dart';

enum RouteStatus { initial, loading, success, error }

class RouteState {
  // final LatLonModel ;
  final RouteStatus sltStopSts;
  final RouteStatus cfrmStopSts;
  final PlaceDtlsModel? stopData;
  final List<LatLonModel>? coordinates;
  final LatLonModel? location;
  final List<PlaceDtlsModel> listOfStops;
  final String? error;
 const RouteState({
    this.sltStopSts = RouteStatus.initial,
    this.cfrmStopSts = RouteStatus.initial,
    this.stopData,
    this.coordinates = const [],
    this.location,
    this.listOfStops = const [],
    this.error,
  });

  RouteState copyWithin({
    RouteStatus? sltStopSts,
    RouteStatus? cfrmStopSts,
    PlaceDtlsModel? stopData,
    List<LatLonModel>? coordinates,
    LatLonModel? location,
    List<PlaceDtlsModel>? listOfStops,
    String? error,
  }) {
    return RouteState(
      sltStopSts: sltStopSts ?? this.sltStopSts,
      cfrmStopSts: cfrmStopSts ?? this.cfrmStopSts,
      stopData: stopData ?? this.stopData,
      coordinates: coordinates ?? this.coordinates,
      location: location ?? this.location,
      listOfStops: listOfStops ?? this.listOfStops,
      error: error ?? this.error,
    );
  }
}
