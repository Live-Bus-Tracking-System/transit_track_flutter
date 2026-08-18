import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/admin_app/features/permit/domain/repository/permit_repo.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class SaerchPendingUseCase {
  final PermitRepo repo;
  SaerchPendingUseCase(this.repo);

  Future<Either<Failure,dynamic>> call(String id)async{
    return repo.searchPending(id);
  }
}