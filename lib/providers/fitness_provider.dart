import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';

import '../services/fitness_service.dart';

class FitnessProvider with ChangeNotifier {
  final FitnessService _fitnessService = FitnessService();
  int _steps = 0;
  String _status = 'Unknown';

  int get steps => _steps;
  String get status => _status;

  void startTracking() {
    _fitnessService.getStepCountStream().listen((StepCount event) {
      _steps = event.steps;
      notifyListeners();
    }).onError((error) {
      print('Step Count Stream Error: $error');
    });

    _fitnessService.getPedestrianStatusStream().listen((PedestrianStatus event) {
      _status = event.status;
      notifyListeners();
    }).onError((error) {
      print('Pedestrian Status Stream Error: $error');
    });
  }
}
