// lib/features/home/data/models/route_model.dart
import 'package:transit_track_flutter/apps/user_app/features/profile/domain/entities.dart';

class RouteModel extends RouteEntity {
  const RouteModel({
    required super.id,
    required super.name,
    required super.routeNumber,
    required super.origin,
    required super.destination,
    required super.currentStop,
    required super.nextStop,
    // required super.status,
    required super.fare,
    required super.durationMinutes,
    required super.distanceKm,
    required super.availableSeats,
    required super.nextDeparture,
    super.isFavorite,
  });

  factory RouteModel.fromJson(Map<String, dynamic> json) {
    return RouteModel(
      id: json['id'] as String,
      name: json['name'] as String,
      routeNumber: json['route_number'] as String,
      origin: json['origin'] as String,
      destination: json['destination'] as String,
      currentStop: json['current_stop'] as String? ?? '',
      nextStop: json['next_stop'] as String? ?? '',
      // status: _parseStatus(json['status'] as String? ?? 'on_time'),
      fare: (json['fare'] as num).toDouble(),
      durationMinutes: json['duration_minutes'] as int? ?? 0,
      distanceKm: json['distance_km'] as String? ?? '0 km',
      availableSeats: json['available_seats'] as int? ?? 0,
      nextDeparture: DateTime.parse(
        json['next_departure'] as String? ?? DateTime.now().toIso8601String(),
      ),
      isFavorite: json['is_favorite'] as bool? ?? false,
    );
  }

  // static BusStatus _parseStatus(String status) {
  //   switch (status) {
  //     case 'delayed':
  //       return BusStatus.delayed;
  //     case 'late':
  //       return BusStatus.late;
  //     default:
  //       return BusStatus.onTime;
  //   }
  // }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'route_number': routeNumber,
    'origin': origin,
    'destination': destination,
    'current_stop': currentStop,
    'next_stop': nextStop,
    // 'status': status.name,
    'fare': fare,
    'duration_minutes': durationMinutes,
    'distance_km': distanceKm,
    'available_seats': availableSeats,
    'next_departure': nextDeparture.toIso8601String(),
    'is_favorite': isFavorite,
  };

  // Mock data for development
  static List<RouteModel> get mockRoutes => [
    RouteModel(
      id: '1',
      name: 'STRANGER',
      routeNumber: 'S-101',
      origin: 'Stranger Road',
      destination: 'Hospitals',
      currentStop: 'Stranger Road - Roadstreet',
      nextStop: 'Hospitals',
      // status: BusStatus.onTime,
      fare: 25.0,
      durationMinutes: 45,
      distanceKm: '12 km',
      availableSeats: 14,
      nextDeparture: DateTime.now().add(const Duration(minutes: 5)),
      isFavorite: false,
    ),
    RouteModel(
      id: '2',
      name: 'MARTA',
      routeNumber: 'M-202',
      origin: 'Vytila Hub Stand',
      destination: 'Computerman',
      currentStop: 'Vytila Hub',
      nextStop: 'Computerman',
      // status: BusStatus.delayed,
      fare: 18.0,
      durationMinutes: 30,
      distanceKm: '8 km',
      availableSeats: 6,
      nextDeparture: DateTime.now().add(const Duration(minutes: 12)),
      isFavorite: true,
    ),
    RouteModel(
      id: '3',
      name: 'STRANGER',
      routeNumber: 'S-103',
      origin: 'Pettah',
      destination: 'Airport',
      currentStop: 'Pettah',
      nextStop: 'Airport Road',
      // status: BusStatus.onTime,
      fare: 40.0,
      durationMinutes: 60,
      distanceKm: '22 km',
      availableSeats: 20,
      nextDeparture: DateTime.now().add(const Duration(minutes: 8)),
      isFavorite: false,
    ),
    // RouteModel(
    //   id: '4',
    //   name: 'MARTA',
    //   routeNumber: 'M-204',
    //   origin: 'Ernakulam',
    //   destination: 'Mattupetty',
    //   currentStop: 'Ernakulam',
    //   nextStop: 'Kakkanad',
    //   status: BusStatus.late,
    //   fare: 55.0,
    //   durationMinutes: 90,
    //   distanceKm: '35 km',
    //   availableSeats: 2,
    //   nextDeparture: DateTime.now().add(const Duration(minutes: 20)),
    //   isFavorite: false,
    // ),
  ];
}

class StopModel extends StopEntity {
  const StopModel({
    required super.id,
    required super.name,
    required super.isPassed,
    required super.isCurrent,
    super.arrivalTime,
  });

  factory StopModel.fromJson(Map<String, dynamic> json) {
    return StopModel(
      id: json['id'] as String,
      name: json['name'] as String,
      isPassed: json['is_passed'] as bool? ?? false,
      isCurrent: json['is_current'] as bool? ?? false,
      arrivalTime: json['arrival_time'] as String?,
    );
  }

  static List<StopModel> get mockStops => [
    const StopModel(
      id: '1',
      name: 'Ernakulam Junction',
      isPassed: true,
      isCurrent: false,
      arrivalTime: '08:00 AM',
    ),
    const StopModel(
      id: '2',
      name: 'Kaloor',
      isPassed: true,
      isCurrent: false,
      arrivalTime: '08:15 AM',
    ),
    const StopModel(
      id: '3',
      name: 'Kakkanad',
      isPassed: false,
      isCurrent: true,
      arrivalTime: '08:30 AM',
    ),
    const StopModel(
      id: '4',
      name: 'Infopark',
      isPassed: false,
      isCurrent: false,
      arrivalTime: '08:45 AM',
    ),
    const StopModel(
      id: '5',
      name: 'Vypin',
      isPassed: false,
      isCurrent: false,
      arrivalTime: '09:00 AM',
    ),
    const StopModel(
      id: '6',
      name: 'Hospitals',
      isPassed: false,
      isCurrent: false,
      arrivalTime: '09:20 AM',
    ),
  ];
}
