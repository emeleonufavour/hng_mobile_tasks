import 'package:equatable/equatable.dart';

class CountryFilters extends Equatable {
  final List<String>? continents;
  final List<String>? timezones;
  final String? locale;

  const CountryFilters({
    this.continents,
    this.timezones,
    this.locale,
  });

  @override
  List<Object?> get props => [continents, timezones, locale];

  CountryFilters copyWith({
    List<String>? continents,
    List<String>? timezones,
    String? locale,
  }) {
    return CountryFilters(
      continents: continents ?? this.continents,
      timezones: timezones ?? this.timezones,
      locale: locale ?? this.locale,
    );
  }
}
