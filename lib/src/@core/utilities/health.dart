import 'package:health/health.dart';

class Health {
  static final List<HealthDataType> healthTypes = [
    HealthDataType.HEART_RATE,
    HealthDataType.STEPS,
    HealthDataType.WORKOUT,
  ];

  final List<HealthDataAccess> healthPermissions = healthTypes.map((e) => HealthDataAccess.READ).toList();
}