import 'package:file_picker/file_picker.dart';

Future<PlatformFile?> pickFile() async {
  final result = await FilePicker.pickFiles(
    withData: true, // 🔥 IMPORTANT
  );

  if (result == null) return null;

  return result.files.first;
}
