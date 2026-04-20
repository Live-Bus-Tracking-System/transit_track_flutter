import 'package:dio/dio.dart';

class ErrorHandler {
  static String handle(DioException error) {
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout) {
      return 'connection timeout. Please try again';
    }
    if (error.type == DioExceptionType.unknown) {
      return 'No internet && Request blocked (CORS / cookie / network issue)';
    }
    if (error.message != null && error.message!.contains('XMLHttpRequest')) {
      return "Browser blocked the request (CORS or Mixed Content).";
    }
    switch (error.response?.statusCode) {
      case 400:
        return 'Invalid request. Please check your input';

      case 401:
        return 'Unauthorized';
      case 403:
        return 'Access denied';
      case 404:
        return 'Data not found';

      case 500:
        return 'Server error. Try again later';

      case 503:
        return "Service unavailable.";

      case 504:
        return 'Server timeout. Please try again';
      default:
        return 'Something went wrong';
    }
  }
}
