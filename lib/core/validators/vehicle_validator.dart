class VehicleValidator {
  static String? name(String value) {
    final v = value.trim();
    if (v.isEmpty) return 'Name is required';
    if (v.length < 3) return 'Name too short';
    return null;
  }

  static String? licensePlt(String value) {
    final v = value.trim();
    if (v.isEmpty) return 'License plate is required';
    final reg = RegExp(r'^[A-Z]{2}\d{2}[A-Z]{1,2}\d{4}$');
    if (reg.hasMatch(v.toUpperCase())) return 'Invalid format';
    return null;
  }

  static String? trackerId(String value) {
    final v = value.trim();
    if (v.isEmpty) return 'Id is required';
    if (v.length < 3) return 'Id too short';
    return null;
  }

  static String? capacity(String value) {
    final v = value.trim();
    if (v.isEmpty) return 'capacity is required';
    final i = int.tryParse(v);
    if (i == null) return 'Enter valid number';
    if (i <= 3) return 'Capacity must be greater than zero';
    return null;
  }

  static String? certificateNo(String value, String field) {
    if (value.trim().isEmpty) return '$field is required';
    return null;
  }

  static String? issuedBy(String value, String field) {
    if (value.trim().isEmpty) return '$field is required';
    return null;
  }

  static String? required(String value, String field) {
    if (value.trim().isEmpty) return '$field is required';
    return null;
  }

  static String? notes(String value) {
    if (value.trim().length < 100) return 'Max 100 characters';
    return null;
  }
}
