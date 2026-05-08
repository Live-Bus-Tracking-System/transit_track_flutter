// lib/features/home/domain/entities/route_entity.dart
import 'package:equatable/equatable.dart';

enum BusStatus { onTime, delayed }

class RouteEntity extends Equatable {
  final String id;
  final String name;
  final String routeNumber;
  final String origin;
  final String destination;
  final String currentStop;
  final String nextStop;
  final BusStatus status;
  final double fare;
  final int durationMinutes;
  final String distanceKm;
  final int availableSeats;
  final DateTime nextDeparture;
  final bool isFavorite;

  const RouteEntity({
    required this.id,
    required this.name,
    required this.routeNumber,
    required this.origin,
    required this.destination,
    required this.currentStop,
    required this.nextStop,
    required this.status,
    required this.fare,
    required this.durationMinutes,
    required this.distanceKm,
    required this.availableSeats,
    required this.nextDeparture,
    this.isFavorite = false,
  });

  String get statusLabel {
    switch (status) {
      case BusStatus.onTime:
        return 'On Time';
      case BusStatus.delayed:
        return 'Delayed';
    }
  }

  @override
  List<Object?> get props => [id, name, routeNumber, status, isFavorite];
}

class StopEntity extends Equatable {
  final String id;
  final String name;
  final bool isPassed;
  final bool isCurrent;
  final String? arrivalTime;

  const StopEntity({
    required this.id,
    required this.name,
    required this.isPassed,
    required this.isCurrent,
    this.arrivalTime,
  });

  @override
  List<Object?> get props => [id, name, isPassed, isCurrent];
}
