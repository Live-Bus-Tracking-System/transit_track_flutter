import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

abstract class PermitRepo {
  Future<Either<Failure,List<dynamic>>> getAllPending();
  Future<Either<Failure,dynamic>> searchPending(String id);
}