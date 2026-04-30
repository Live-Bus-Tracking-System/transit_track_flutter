import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:transit_track_flutter/core/error/api_excetion.dart';
import 'package:transit_track_flutter/core/error/error_handler.dart';

class DocurlRemoteDataSource {
  final Dio dio;

  DocurlRemoteDataSource() : dio = Dio();

  Future<String> upload(PlatformFile file) async {
    final extract = FormData.fromMap({
      "file": MultipartFile.fromBytes(file.bytes!, filename: file.name),
    });
    try {
      final response = await dio.post('path', data: extract);
      return response.data['url'];
    } on DioException catch (e) {
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }
}
