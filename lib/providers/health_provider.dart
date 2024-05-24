import 'package:flutter/material.dart';

import '../models/health_tip.dart';
import '../services/health_service.dart';
import '../services/notification_service.dart';

class HealthProvider with ChangeNotifier {
  final HealthService _healthService = HealthService();
  final NotificationService _notificationService = NotificationService();
  List<HealthTip> _healthTips = [];
  bool _isLoading = false;

  List<HealthTip> get healthTips => _healthTips;
  bool get isLoading => _isLoading;

  HealthProvider() {
    _notificationService.initialize();
  }

  Future<void> fetchHealthTips() async {
    _isLoading = true;
    notifyListeners();

    try {
      List<dynamic> data = await _healthService.fetchHealthTips();
      _healthTips = data.map((tip) => HealthTip.fromJson(tip)).toList();
    } catch (e) {
      print(e.toString());
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> setDailyReminder() async {
    if (_healthTips.isNotEmpty) {
      final randomTip = (_healthTips.toList()..shuffle()).first;
      await _notificationService.scheduleDailyNotification(
        0,
        "Daily Wellness Tip",
        randomTip.title,
        TimeOfDay(hour: 8, minute: 0),
      );
    }
  }
}
