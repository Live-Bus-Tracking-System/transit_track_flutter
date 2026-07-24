import 'package:transit_track_flutter/apps/user_app/features/auth/domain/entites/auth.dart';

class UserAuthModel extends Auth {
  UserAuthModel({
    super.id,
    super.name,
    super.email,
    super.phone,
    super.password,
    super.role,
    super.roleId,
  });
  factory UserAuthModel.fromJson(Map<String, dynamic> fromMap) {
    return UserAuthModel(
      id: fromMap["id"],
      email: fromMap["email"],
      name: fromMap["fullName"],
      role: (fromMap['roles'] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "fullName": name,
      "phoneNumber": phone,
      "email": email,
      "password": password,
    };
  }
}
