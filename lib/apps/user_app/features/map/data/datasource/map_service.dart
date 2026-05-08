import 'package:dio/dio.dart';
import 'package:transit_track_flutter/apps/user_app/features/map/data/model/map_model.dart';
import 'package:transit_track_flutter/apps/user_app/features/map/data/repository/serve_exception.dart';
import 'package:transit_track_flutter/core/network/dio_client_user.dart';

class MapService {
  final DioClientUser client;
  MapService(this.client);

  Future <List<MapModel>>fetch()async{
    try {
      final respo= await client.dio.get("");
      if (respo.statusCode==200) {
        return (respo.data as List).map((e)=>MapModel.fromjson(e)).toList(); 
      }else {
      throw ServeException(
        message: "Failed to load map data",
      );
    }
    }on DioException catch (e){
      throw ServeException(message: "Same thing worng");
    } catch (e) {
        throw ServeException(message: "Same thing worng");
      
    }
  }
}