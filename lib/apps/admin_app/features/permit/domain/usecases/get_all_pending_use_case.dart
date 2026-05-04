import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/admin_app/features/permit/domain/repository/permit_repo.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class GetAllPendingUseCase {
  final PermitRepo repo;
  GetAllPendingUseCase(this.repo);

  Future<Either<Failure,List<dynamic>>> call()async{
    return repo.getAllPending();
  }
}