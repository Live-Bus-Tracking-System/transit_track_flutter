import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/dashboard/data/data_source/dsh_local_data_source.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/dashboard/domain/repository/dsh_repo.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class DshImpl implements DshRepo {
  final DshLocalDataSource local;
  DshImpl(this.local);
  @override
  Either<Failure, String?> getDp() {
    try {
      final data = local.getDpImage();
      if (data == null) return Right(null);
      return Right(data);
    } catch (e) {
      return Left(NetworkFailure('no internet'));
    }
  }
}
