import 'package:flutter/material.dart';
import 'package:local_storage/common/route_constants.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Local Storage'),
        ),
        body: Center(
          child: ListView(
            children: [
              ListTile(
                title: const Text('Local database'),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () =>
                      Navigator.of(context).pushNamed(RouteList.localDb),
                ),
              ),
            ],
          ),
        ),
      );
}
