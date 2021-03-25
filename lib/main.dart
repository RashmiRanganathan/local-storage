import 'package:flutter/material.dart';
import 'package:local_storage/data/shared_preferences/local_preferences.dart';
import 'package:local_storage/presentation/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalPreferences().init();

  runApp(App());
}
