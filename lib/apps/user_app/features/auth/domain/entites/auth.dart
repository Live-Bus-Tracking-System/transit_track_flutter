class Auth {
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? password;
  final List<String>? role;
  final String? roleId;
  Auth({required this.id,required this.name, required this.phone, required this.email, this.password,required this.role,required this.roleId});
}