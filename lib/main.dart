import 'package:flutter/material.dart';
import 'package:local_storage/data/local_database/friends_local_datasource.dart';
import 'package:local_storage/data/shared_preferences/local_preferences.dart';
import 'package:local_storage/presentation/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalPreferences().init();

  await FriendsLocalDatasource().init();

  runApp(App());
}
