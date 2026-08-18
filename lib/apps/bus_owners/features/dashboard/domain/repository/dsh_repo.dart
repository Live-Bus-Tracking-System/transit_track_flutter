import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/dashboard/data/data_source/dsh_local_data_source.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

abstract class DshRepo {
Either<Failure,String?> getDp();

}