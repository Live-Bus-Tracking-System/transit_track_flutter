import 'package:dio/dio.dart';
import 'package:transit_track_flutter/core/error/error_handler.dart';

class AuthErrorHandler {
  static String handler(DioException e) {
    switch (e.response?.statusCode) {
      case 401:
        return 'Invalid email or password';
      case 410:
        return 'Session expired. please login';
      default:
        return ErrorHandler.handle(e);
    }
  }
}
