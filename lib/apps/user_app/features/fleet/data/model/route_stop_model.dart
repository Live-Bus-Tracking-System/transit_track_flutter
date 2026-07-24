class RouteStop {
  final String name;
  final String time;
  final bool completed;
  final bool current;

  const RouteStop({
    required this.name,
    required this.time,
    this.completed = false,
    this.current = false,
  });
}