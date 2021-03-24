import 'package:flutter/material.dart';
import 'package:local_storage/common/route_constants.dart';
import 'package:local_storage/presentation/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Storage Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: Routes.getAll(),
      initialRoute: RouteList.inital,
    );
  }
}
