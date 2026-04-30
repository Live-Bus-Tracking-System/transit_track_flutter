import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/repository/vehicle_repo.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/model/stop_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/domain/repository/route_repo.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class AddStopUseCase {
  final RouteRepo repo;
  AddStopUseCase(this.repo);

  Future<Either<Failure,String>> call(StopModel model)async{
    return repo.addStop(model);
  }
}