import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/auth/domain/repository/bus_owners_auth_repo.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class LogoutBusOwnerUseCase {
  final BusOwnersAuthRepo repo;
  LogoutBusOwnerUseCase(this.repo);

  Future<Either<Failure,String>> call()async{
    return repo.logOut();
  }
}