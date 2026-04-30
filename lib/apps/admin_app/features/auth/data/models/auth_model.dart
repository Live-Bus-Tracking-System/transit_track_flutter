import 'package:transit_track_flutter/apps/admin_app/features/auth/domain/entities/admin_entity.dart';

class AdminModel extends AdminEntity {
  AdminModel({super.id, super.name, super.phone, super.email, super.password});

  factory AdminModel.fromJson(Map<String, dynamic> json) {
    return AdminModel(
      id: json['data']['id'],
      name: json['data']['fullName'],
      phone: json['data']['phone'],
      email: json['data']['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"emailOrPhone": email, "password": password};
  }
}
