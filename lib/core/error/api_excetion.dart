class ApiExcetion implements Exception {
  final String message;
  final int? statuCode;
  ApiExcetion({required this.message, this.statuCode});
}
