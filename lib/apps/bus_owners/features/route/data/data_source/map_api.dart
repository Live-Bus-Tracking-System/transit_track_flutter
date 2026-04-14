import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/model/place_dtls_model.dart';
import 'package:transit_track_flutter/core/error/api_constants.dart';
import 'package:transit_track_flutter/core/error/exception.dart';

class MapApi {
  final Dio dio = Dio();

  Future<PlaceDtlsModel?> getDetails(double ltn,double lng) async {
    try {
      final response = await dio.get(
        ApiConstants.mapUrl,
        queryParameters: {
          'format': 'json',
          'lat': ltn,
          'lon': lng,
        },
        options: Options(headers: {'User-Agent': 'flutter_app'}),
      );
      if (response.statusCode == 200) {
        return PlaceDtlsModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
