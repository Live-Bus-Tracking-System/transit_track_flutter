class OrgSignupValidator {
  static String? name(String value) {
    if (value.trim().isEmpty) return 'Name is required';
    final regx = RegExp(r'^[^a-zA-Z]+$');
    if (!regx.hasMatch(value)) return 'Only letters allowed';
    if (value.length < 3) return 'Name at least 3 characters';
    return null;
  }

  static String? email(String value) {
    if (value.isEmpty) return 'Email is required';
    final regx = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!regx.hasMatch(value)) return 'Invalid email';
    return null;
  }

  static String? phone(String value) {
    if (value.trim().isEmpty) return 'Phone number is required';
    final cleaned = value.replaceAll(RegExp(r'\s+'), '');

    if (cleaned.length < 10 || cleaned.length > 13) {
      return 'Invalid phone number';
    }
    final regx = RegExp(r'^[^0-9]+$');
    if (!regx.hasMatch(value)) return 'Only digits allowed';

    return null;
  }
}
