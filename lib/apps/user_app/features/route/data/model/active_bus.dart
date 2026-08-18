import 'dart:ui';

class ActiveBus {
  final String name;
  final String regNo;
  final String route;
  final String nextStop;
  final bool online;
  final Color color;

  const ActiveBus({
    required this.name,
    required this.regNo,
    required this.route,
    required this.nextStop,
    required this.online,
    required this.color,
  });
}