// import 'package:dio/dio.dart';
// import 'package:transit_track_flutter/core/constants/strings/api_constants.dart';

// abstract class RemoteHomeDataSource {
//   Future<List<RouteModel>> getPopularRoutes();
//   Future<List<RouteModel>> getRecentRoutes();
//   Future<List<RouteModel>> searchRoutes(String query);
//   Future<RouteModel> getRouteDetail(String routeId);
//   Future<List<StopModel>> getRouteStops(String routeId);
//   Future<List<RouteModel>> getSavedBuses();
//   Future<void> saveBus(String busId);
//   Future<void> removeSavedBus(String busId);
// }

// class RemoteHomeDataSourceImpl implements RemoteHomeDataSource {
//   final Dio _dio;


//   static const bool _useMock = true;

//   RemoteHomeDataSourceImpl(this._dio);

//   @override
//   Future<List<RouteModel>> getPopularRoutes() async {
//     try {
//       if (_useMock) {
//         await Future.delayed(const Duration(milliseconds: 800));
//         return RouteModel.mockRoutes;
//       }
//       final response = await _dio.get(ApiConstants.popularRoutes);
//       return (response.data['data'] as List)
//           .map((e) => RouteModel.fromJson(e))
//           .toList();
//     } on DioException catch (e) { 
//       _handleError(e);
//     }
//     return [];
//   }

//   @override
//   Future<List<RouteModel>> getRecentRoutes() async {
//     try {
//       if (_useMock) {
//         await Future.delayed(const Duration(milliseconds: 600));
//         return RouteModel.mockRoutes.take(2).toList();
//       }
//       final response = await _dio.get(ApiConstants.recentRoutes);
//       return (response.data['data'] as List)
//           .map((e) => RouteModel.fromJson(e))
//           .toList();
//     } on DioException catch (e) {
//       _handleError(e);
//     }
//     return [];
//   }

//   @override
//   Future<List<RouteModel>> searchRoutes(String query) async {
//     try {
//       if (_useMock) {
//         await Future.delayed(const Duration(milliseconds: 500));
//         return RouteModel.mockRoutes
//             .where((r) =>
//                 r.name.toLowerCase().contains(query.toLowerCase()) ||
//                 r.origin.toLowerCase().contains(query.toLowerCase()) ||
//                 r.destination.toLowerCase().contains(query.toLowerCase()))
//             .toList();
//       }
//       final response = await _dio.get(ApiConstants.searchRoutes,
//           queryParameters: {'q': query});
//       return (response.data['data'] as List)
//           .map((e) => RouteModel.fromJson(e))
//           .toList();
//     } on DioException catch (e) {
//       _handleError(e);
//     }
//     return [];
//   }

//   @override
//   Future<RouteModel> getRouteDetail(String routeId) async {
//     try {
//       if (_useMock) {
//         await Future.delayed(const Duration(milliseconds: 400));
//         return RouteModel.mockRoutes.firstWhere((r) => r.id == routeId,
//             orElse: () => RouteModel.mockRoutes.first);
//       }
//       final response = await _dio.get('${ApiConstants.routeDetail}/$routeId');
//       return RouteModel.fromJson(response.data['data']);
//     } on DioException catch (e) {
//       _handleError(e);
//     }
//     throw const ServerException(message: 'Route not found');
//   }

//   @override
//   Future<List<StopModel>> getRouteStops(String routeId) async {
//     try {
//       if (_useMock) {
//         await Future.delayed(const Duration(milliseconds: 400));
//         return StopModel.mockStops;
//       }
//       final response = await _dio.get(
//         ApiConstants.routeStops.replaceFirst('{id}', routeId),
//       );
//       return (response.data['data'] as List)
//           .map((e) => StopModel.fromJson(e))
//           .toList();
//     } on DioException catch (e) {
//       _handleError(e);
//     }
//     return [];
//   }

//   @override
//   Future<List<RouteModel>> getSavedBuses() async {
//     try {
//       if (_useMock) {
//         await Future.delayed(const Duration(milliseconds: 600));
//         return RouteModel.mockRoutes.where((r) => r.isFavorite).toList();
//       }
//       final response = await _dio.get(ApiConstants.savedBuses);
//       return (response.data['data'] as List)
//           .map((e) => RouteModel.fromJson(e))
//           .toList();
//     } on DioException catch (e) {
//       _handleError(e);
//     }
//     return [];
//   }

//   @override
//   Future<void> saveBus(String busId) async {
//     try {
//       if (_useMock) {
//         await Future.delayed(const Duration(milliseconds: 300));
//         return;
//       }
//       await _dio.post(ApiConstants.saveBus.replaceFirst('{busId}', busId));
//     } on DioException catch (e) {
//       _handleError(e);
//     }
//   }

//   @override
//   Future<void> removeSavedBus(String busId) async {
//     try {
//       if (_useMock) {
//         await Future.delayed(const Duration(milliseconds: 300));
//         return;
//       }
//       await _dio.delete(ApiConstants.saveBus.replaceFirst('{busId}', busId));
//     } on DioException catch (e) {
//       _handleError(e);
//     }
//   }

//   Never _handleError(DioException e) {
//     if (e.type == DioExceptionType.connectionError) {
//       throw const NetworkException();
//     }
//     throw ServerException(
//         message: e.response?.data?['message'] ?? 'Server error',
//         statusCode: e.response?.statusCode);
//   }
// }
