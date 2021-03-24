import 'dart:io';

import 'package:path_provider/path_provider.dart';

class LocalFiles {
  Future<String> get _getAppDirpath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> getFile(String fileName) async {
    final path = await _getAppDirpath;
    return File('$path/$fileName');
  }

  Future<File> writeFile(String fileName, String data) async {
    final file = await getFile(fileName);
    return file.writeAsString(data);
  }

  Future<String> readFile(String fileName) async {
    try {
      final file = await getFile(fileName);

      final String contents = await file.readAsString();
      return contents;
    } catch (e) {
      return '';
    }
  }
}
