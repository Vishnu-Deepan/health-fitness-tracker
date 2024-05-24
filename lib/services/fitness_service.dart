import 'package:pedometer/pedometer.dart';

class FitnessService {
  Stream<StepCount> getStepCountStream() {
    return Pedometer.stepCountStream;
  }

  Stream<PedestrianStatus> getPedestrianStatusStream() {
    return Pedometer.pedestrianStatusStream;
  }
}
