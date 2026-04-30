import 'package:file_picker/file_picker.dart';

Future<PlatformFile?> pickFile() async {
  final file = await FilePicker.pickFiles( );

  if (file == null) return null;

  return file.files.first;
}
