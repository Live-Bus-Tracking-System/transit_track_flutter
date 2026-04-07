import 'package:transit_track_flutter/apps/admin_app/features/auth/domain/entities/auth.dart';

class AuthModel extends Auth {
  AuthModel({required super.email, required super.password});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(email: json['emailOrPhone'], password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {"emailOrPhone": email, "password": password};
  }
}
