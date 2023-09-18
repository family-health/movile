class HealthDataPointModel {
  final String code;
  final String type;
  final String unit;
  final String value;
  final bool synchronized;

  HealthDataPointModel({
    required this.code,
    required this.type,
    required this.unit,
    required this.value,
    required this.synchronized,
  });

  factory HealthDataPointModel.fromMap(Map<String, dynamic> map) {
    return HealthDataPointModel(
      code: map['code'] ?? '',
      type: map['type'] ?? '',
      unit: map['unit'] ?? '',
      value: map['value'] ?? '',
      synchronized: map['synchronized'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {                
    return {
      'code': code,
      'type': type,
      'unit': unit,
      'value': value,
      'synchronized': synchronized,
    };
  }
}