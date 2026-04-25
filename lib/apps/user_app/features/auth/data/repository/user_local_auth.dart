import 'package:transit_track_flutter/apps/user_app/features/auth/data/datasocuse/user_auth_service.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/data/datasocuse/user_local_auth.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/data/model/auth_model.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/domain/entites/repository/auth_repo.dart';

class UserReposImp implements AuthRepos{
final UserAuthService remoteService;
final LocalDataService localDataService;

UserReposImp({required this.remoteService,required this.localDataService });


@override
Future<UserAuthModel> userLogin(String email, String password)async{
  final user = await remoteService.login(email: email, password: password);
  await localDataService.cacheUserData(user.id, user.email);
  
  return user;
}

@override
Future<UserAuthModel> register(UserAuthModel user)async{
final newUser = await remoteService.register(user);
await localDataService.cacheUserData(newUser.id, newUser.email);

return  newUser;
}


Future<void> logout( bool isLogged)async{
  await remoteService.logout();
  await localDataService.clearData();
}
}