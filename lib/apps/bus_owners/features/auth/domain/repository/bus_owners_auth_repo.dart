import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/auth/data/model/bus_owners_model.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

abstract class BusOwnersAuthRepo {
  Future<Either<Failure,BusOwnersModel>> create(BusOwnersModel model);
}