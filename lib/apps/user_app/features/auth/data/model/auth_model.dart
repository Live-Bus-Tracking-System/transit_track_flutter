import 'package:transit_track_flutter/apps/user_app/features/auth/domain/entites/auth.dart';

class UserAuthModel extends Auth {
  UserAuthModel({
    required super.id,
    required super.email,
    super.password,
    required super.role,
    required super.roleId,
  });
  factory UserAuthModel.fromJson(Map<String, dynamic> fromMap) {
    return UserAuthModel(
      id: fromMap["id"],
      email: fromMap["email"],
      role: (fromMap['roles'] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
      roleId: fromMap["organizationId"],
    );
  }
  Map<String, dynamic> toMap() {
    return {"id": id, "email": email, "password": password};
  }
}
