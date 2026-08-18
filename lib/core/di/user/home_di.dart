import 'package:shared_preferences/shared_preferences.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/bloc/home_bloc_bloc.dart';
import 'package:transit_track_flutter/core/network/dio_client_user.dart';

class HomeDi {
 
  HomeBlocBloc create(){
    return HomeBlocBloc();
  }
}