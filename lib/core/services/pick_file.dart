import 'package:file_picker/file_picker.dart';

Future<PlatformFile?> pickFile() async {
  final file = await FilePicker.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['pdf', 'doc', 'docx', 'png', 'jpg'],
    withData: true,
  );

  if (file == null) return null;

  return file.files.first;
}
