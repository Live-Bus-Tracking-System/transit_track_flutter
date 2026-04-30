part of 'route_bloc.dart';

enum RouteStatus { initial, loading, success, error }

class RouteState {

  final RouteStatus sltStopSts;
  final RouteStatus cfrmStopSts;
  final RouteStatus stopStatus;
  final PlaceDtlsModel? stopData;
  final List<LatLonModel>? coordinates;
  final LatLonModel? location;
  final List<PlaceDtlsModel> listOfStops;
  final String? error;
  final String? message;
  const RouteState({
    this.sltStopSts = RouteStatus.initial,
    this.cfrmStopSts = RouteStatus.initial,
    this.stopStatus = RouteStatus.initial,
    this.stopData,
    this.coordinates = const [],
    this.location,
    this.listOfStops = const [],
    this.error,
    this.message,
  });

  RouteState copyWithin({
    RouteStatus? sltStopSts,
    RouteStatus? cfrmStopSts,
    RouteStatus? stopStatus,
    PlaceDtlsModel? stopData,
    List<LatLonModel>? coordinates,
    LatLonModel? location,
    List<PlaceDtlsModel>? listOfStops,
    String? error,
    String? message,
  }) {
    return RouteState(
      sltStopSts: sltStopSts ?? this.sltStopSts,
      cfrmStopSts: cfrmStopSts ?? this.cfrmStopSts,
      stopStatus: stopStatus ?? this.stopStatus,
      stopData: stopData ?? this.stopData,
      coordinates: coordinates ?? this.coordinates,
      location: location ?? this.location,
      listOfStops: listOfStops ?? this.listOfStops,
      error: error ?? this.error,
      message: message ?? this.message,
    );
  }
}
