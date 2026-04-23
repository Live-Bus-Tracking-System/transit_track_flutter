import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/auth/data/model/bus_owners_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/auth/domain/repository/bus_owners_auth_repo.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class CreateBusOwnerUseCase {
  final BusOwnersAuthRepo repo;
  CreateBusOwnerUseCase(this.repo);

  Future<Either<Failure, BusOwnersModel>> call(BusOwnersModel model) async {
    return repo.create(model);
  }
}
