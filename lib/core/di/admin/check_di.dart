import 'package:hive_flutter/adapters.dart';
import 'package:transit_track_flutter/apps/admin_app/features/landing/data/data_source/local_data_source.dart';
import 'package:transit_track_flutter/apps/admin_app/features/landing/data/repository/check_state_impl.dart';
import 'package:transit_track_flutter/apps/admin_app/features/landing/domain/usecases/check_state.dart';
import 'package:transit_track_flutter/apps/admin_app/features/landing/presentation/bloc/checkstate_bloc.dart';

class CheckDi {
  late final CheckstateBloc bloc;
  Future<void> init({required Box<bool> hive})async{
   final local=LocalDataSource(hive);
   final impl=CheckStateImpl(local);
   bloc=CheckstateBloc(CheckStateCase(impl));
  }
}