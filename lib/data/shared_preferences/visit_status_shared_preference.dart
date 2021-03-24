import 'package:local_storage/data/shared_preferences/local_preferences.dart';

class VisitStatus {
  final LocalPreferences _localPreferences = LocalPreferences();

  void updateVisitCount() {
    final int visitCount = _localPreferences.get('visitCount') ?? 0;
    _localPreferences.set('visitCount', visitCount + 1);
  }

  int getVisitCount() {
    final int visitCount = _localPreferences.get('visitCount');
    return visitCount;
  }
}
