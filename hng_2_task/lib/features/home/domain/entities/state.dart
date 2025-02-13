import 'package:equatable/equatable.dart';

class StateEntity extends Equatable {
  final String name;
  final String iso2;
  final String fipsCode;

  const StateEntity({
    required this.name,
    required this.iso2,
    required this.fipsCode,
  });

  @override
  List<Object?> get props => [name, iso2, fipsCode];
}
