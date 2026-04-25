import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/data/repository/auth_repo_impl.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/dashboard/presentation/view/dashboard.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/data/datasocuse/user_auth_service.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/data/datasocuse/user_local_auth.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/data/repository/user_local_auth.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/domain/usecase/local_data_user.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/domain/usecase/login_user.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/domain/usecase/logout_user.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/domain/usecase/user_register.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/presentation/bloc/auth_bloc_bloc.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/presentation/view/login.dart';
import 'package:transit_track_flutter/apps/user_app/features/bottom/view/bottom_bar.dart';
import 'package:transit_track_flutter/apps/user_app/features/map/view/map.dart';

void main() {
  final userAuthRepo = UserReposImp(
    remoteService: UserAuthService(),
    localDataService: LocalDataService(),
  );
  runApp(
    BlocProvider(
      create: (context) => AuthBlocBloc(
        loginUser: LoginUser(repo: userAuthRepo),
        registerUser: UserRegister(userAuthRepo),
        logoutUser: LogoutUser(userAuthRepo),
        localDataSource: LocalDataUser(repo: userAuthRepo),
      ),
      child: const UserApp(),
    )
  );
}

class UserApp extends StatelessWidget {
  const UserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: const Login());
  }
}
