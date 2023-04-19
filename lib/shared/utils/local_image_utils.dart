import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

Future<String> saveLocalImage(
    Uint8List byteData, String fileName, bool isOrigin) async {
  final appDocDir = await getApplicationDocumentsDirectory();
  final folderName = isOrigin ? "ori" : "mod";
  final path = "${appDocDir.path}/$folderName/$fileName";
  final file = File(path);
  await file.create(recursive: true);
  await file.writeAsBytes(byteData);
  return path;
}

// Future<File> loadLocalImage(String fileName) async {
//   final appDocDir = await getApplicationDocumentsDirectory();
//   final path = "${appDocDir.path}/$fileName";
//   final file = File(path);
//   return file;
// }
