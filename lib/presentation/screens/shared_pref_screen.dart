import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:local_storage/data/shared_preferences/visit_status_shared_preference.dart';

class SharedPrefScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VisitStatus().updateVisitCount();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preference'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            const Text(
              'Visit Times',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              VisitStatus().getVisitCount().toString(),
              style: const TextStyle(fontSize: 44),
            ),
          ],
        ),
      ),
    );
  }
}
