import 'package:equatable/equatable.dart';
import 'package:hng_2_task/features/features.dart';

abstract class CountriesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCountries extends CountriesEvent {
  final int? page;
  final int? perPage;

  GetCountries({this.page, this.perPage});
}

class SearchCountries extends CountriesEvent {
  final String query;

  SearchCountries(this.query);
}

class ApplyFilters extends CountriesEvent {
  final CountryFilters filters;
  ApplyFilters(this.filters);

  @override
  List<Object?> get props => [filters];
}
