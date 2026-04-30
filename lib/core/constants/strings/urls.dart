import 'package:flutter_dotenv/flutter_dotenv.dart';

class Urls {
  static const flutterMapUrl =
      'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png';
  static const mapUrlDark =
      'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png';

  static String baseUrl = dotenv.env['TRANSIT_BASE_URL']!;
  static String crdGetUrl = dotenv.env['MAP_BASE_URL']!;
  static String crdBaseUrl = dotenv.env['CRDTS_BASE_URL']!;
  static String crdApiKey = dotenv.env['CRD_API_KEY']!;
}
