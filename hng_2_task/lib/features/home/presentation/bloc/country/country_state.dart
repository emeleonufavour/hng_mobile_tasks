import 'package:hng_2_task/features/features.dart';

abstract class CountriesState {}

class CountriesInitial extends CountriesState {}

class CountriesLoading extends CountriesState {}

class CountriesLoaded extends CountriesState {
  final PaginatedResponse<Country> response;

  CountriesLoaded(this.response);
}

class CountriesError extends CountriesState {
  final String message;

  CountriesError(this.message);
}
