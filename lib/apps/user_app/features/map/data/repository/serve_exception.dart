class ServeException implements Exception{
  final String message;
  ServeException({required this.message});

  @override
  String toString()=> message;
}