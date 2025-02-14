import 'package:equatable/equatable.dart';
import 'package:hng_2_task/features/features.dart';

class CountriesState extends Equatable {
  final List<Country>? countries;
  final String currentLocale;

  const CountriesState({
    this.countries,
    this.currentLocale = 'eng',
  });

  @override
  List<Object?> get props => [countries, currentLocale];
}

class CountriesInitial extends CountriesState {}

class CountriesLoading extends CountriesState {}

class CountriesLoaded extends CountriesState {
  @override
  final List<Country> countries;

  const CountriesLoaded(
    this.countries, {
    super.currentLocale,
  }) : super(countries: countries);
}

class CountriesError extends CountriesState {
  final String message;

  const CountriesError(this.message);
}
