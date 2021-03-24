import 'package:local_storage/data/local_files/local_files.dart';

class ProfileDetail {
  final LocalFiles _localFiles = LocalFiles();

  Future<void> updateName(String name) async {
    await _localFiles.writeFile('profile.txt', name);
  }

  Future<String> getName() async {
    final String name = await _localFiles.readFile('profile.txt');
    return name;
  }
}
