import 'package:transit_track_flutter/apps/user_app/features/auth/domain/entites/auth.dart';

class UserAuthModel extends Auth {
  UserAuthModel({
    required super.id,
    required super.email,
    required super.password,
  });
  factory UserAuthModel.fromJson(Map<String, dynamic> fromMap) {
    return UserAuthModel(
      id: fromMap["id"],
      email: fromMap["email"],
      password: fromMap["password"],
    );
  }
  Map<String, dynamic> toMap() {
    return {"id": id, "email": email, "password": password};
  }
}
