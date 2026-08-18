class Auth {
  final String id;
  final String email;
  final String? password;
  final List<String> role;
  final String roleId;
  Auth({required this.id, required this.email, this.password,required this.role,required this.roleId});
}