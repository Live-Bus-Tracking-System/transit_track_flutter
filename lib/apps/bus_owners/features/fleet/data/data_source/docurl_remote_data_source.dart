import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:transit_track_flutter/core/error/api_excetion.dart';
import 'package:transit_track_flutter/core/error/error_handler.dart';
import 'package:transit_track_flutter/core/network/dio_client_user.dart';

class DocurlRemoteDataSource {
  final Dio dio;
  final DioClientUser user;

  DocurlRemoteDataSource(this.user) : dio = Dio();

  Future<String> upload({
    required PlatformFile file,
    required Function(double, String) progress,
    required Function(String) onLong,
  }) async {
    final Uint8List fileBytes = file.bytes!;
    final startTime = DateTime.now();

    try {
      final response = await dio.get('/Documents/upload-url');
      await dio.put(
        '',
        data: fileBytes,
        options: Options(headers: {"Content-Type": "application/octet-stream"}),
        onSendProgress: (count, total) {
          if (total > 0) {
            double percent = count / total;

            // ⏱ speed calculation (same as JS)
            final elapsed = DateTime.now().difference(startTime).inSeconds;

            String speed = "Calculating...";
            if (elapsed > 0) {
              final bytesPerSecond = count / elapsed;
              speed = "${_formatBytes(bytesPerSecond)}/s";
            }
            progress(percent, speed);
          }
        },
      );
      print('upload success');
      return '';
    } on DioException catch (e) {
      onLong('failed');
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }

  String _formatBytes(num bytes) {
    const sizes = ['B', 'KB', 'MB', 'GB'];
    int i = 0;

    while (bytes >= 1024 && i < sizes.length - 1) {
      bytes /= 1024;
      i++;
    }

    return "${bytes.toStringAsFixed(2)} ${sizes[i]}";
  }
}
