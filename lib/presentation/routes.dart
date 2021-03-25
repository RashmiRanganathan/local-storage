import 'package:flutter/material.dart';
import 'package:local_storage/common/route_constants.dart';
import 'package:local_storage/presentation/screens/dashboard_screen.dart';
import 'package:local_storage/presentation/screens/local_db_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getAll() => {
        RouteList.inital: (context) => DashboardScreen(),
        RouteList.localDb: (context) => LocalDatabase(),
      };
}
