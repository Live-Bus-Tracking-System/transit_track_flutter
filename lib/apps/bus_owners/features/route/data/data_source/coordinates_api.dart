import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/model/lat_lon_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/model/place_dtls_model.dart';
import 'package:transit_track_flutter/core/constants/strings/api_constants.dart';

class CoordinatesApi {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['CRDTS_BASE_URL']!,
      headers: {
        'Authorization': dotenv.env['CRD_API_KEY']!,
        'Content-Type': 'application/json',
      },
    ),
  );
  CoordinatesApi();

  Future<List<LatLonModel>> getCoordinated(List<PlaceDtlsModel> points) async {
    final c = points.map((point) => [point.lon!, point.lat!]).toList();
  
    try {
      final response = await dio.post(
        ApiConstants.geoJson,
        data: {'coordinates': c},
      );
      final data = response.data;
      final crd = data['features'][0]['geometry']['coordinates'] as List;
      final last = crd.map<LatLng>((c) => LatLng(c[1], c[0])).toList();
      return last
          .map((l) => LatLonModel(lat: l.latitude, lon: l.longitude))
          .toList();
    } catch (e) {
      throw Exception('Api error on ${e.toString()}');
    }
  }
}
