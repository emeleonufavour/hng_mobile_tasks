import 'package:hng_2_task/features/features.dart';

class StateModel extends StateEntity {
  const StateModel({
    required super.name,
    required super.iso2,
    required super.fipsCode,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      name: json['name'] ?? '',
      iso2: json['iso2'] ?? '',
      fipsCode: json['fips_code'] ?? '',
    );
  }
}
