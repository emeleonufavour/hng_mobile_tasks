import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hng_2_task/features/features.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  final CountryRepository repository;
  PaginatedResponse<Country>? currentResponse;
  CountryFilters? currentFilters;

  CountriesBloc(this.repository) : super(CountriesInitial()) {
    on<GetCountries>(_onGetCountries);
    on<SearchCountries>(_onSearchCountries);
    on<ApplyFilters>(_onApplyFilters);
  }

  Future<void> _onGetCountries(
    GetCountries event,
    Emitter<CountriesState> emit,
  ) async {
    emit(CountriesLoading());

    final result = await repository.getCountries(
      page: event.page,
      perPage: event.perPage,
    );

    result.fold((failure) => emit(CountriesError(failure.message)), (response) {
      currentResponse = response;
      emit(CountriesLoaded(response));
    });
  }

  Future<void> _onSearchCountries(
    SearchCountries event,
    Emitter<CountriesState> emit,
  ) {
    if (currentResponse == null) return Future.value();

    if (event.query.isEmpty) {
      emit(CountriesLoaded(currentResponse!));
      return Future.value();
    }

    final filteredCountries = currentResponse!.data.where((country) {
      return country.name?.toLowerCase().contains(event.query.toLowerCase()) ??
          false;
    }).toList();

    final updatedResponse = currentResponse!.copyWith(
      data: filteredCountries,
      meta: PaginationMeta(
        currentPage: currentResponse!.meta.currentPage,
        from: 1,
        lastPage: 1,
        path: currentResponse!.meta.path,
        perPage: filteredCountries.length,
        to: filteredCountries.length,
        total: filteredCountries.length,
      ),
    );

    emit(CountriesLoaded(updatedResponse));
    return Future.value();
  }

  Future<void> _onApplyFilters(
    ApplyFilters event,
    Emitter<CountriesState> emit,
  ) async {
    if (currentResponse == null) return;

    currentFilters = event.filters;
    final filteredCountries = currentResponse!.data.where((country) {
      bool matchesContinent = event.filters.continents == null ||
          event.filters.continents!.contains(country.continent);

      return matchesContinent;
    }).toList();

    final updatedResponse = currentResponse!.copyWith(
      data: filteredCountries,
      meta: PaginationMeta(
        currentPage: 1,
        from: 1,
        lastPage: 1,
        path: currentResponse!.meta.path,
        perPage: filteredCountries.length,
        to: filteredCountries.length,
        total: filteredCountries.length,
      ),
    );

    emit(CountriesLoaded(updatedResponse));
  }
}
