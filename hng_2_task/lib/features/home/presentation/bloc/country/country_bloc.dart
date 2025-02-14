import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hng_2_task/features/features.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  final CountryRepository repository;
  List<Country>? currentResponse;
  CountryFilters? currentFilters;

  CountriesBloc(this.repository) : super(CountriesInitial()) {
    on<GetCountries>(_onGetCountries);
    on<SearchCountries>(_onSearchCountries);
    on<ApplyFilters>(_onApplyFilters);
    on<ChangeLocale>(_onChangeLocale);
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

    result.fold(
      (failure) => emit(CountriesError(failure.message)),
      (response) {
        currentResponse = response;
        emit(CountriesLoaded(response));
      },
    );
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

    final filteredCountries = currentResponse!.where((country) {
      final commonName = country.name?.common;
      if (commonName == null) return false;

      return commonName.toLowerCase().contains(event.query.toLowerCase());
    }).toList();

    emit(CountriesLoaded(filteredCountries));
    return Future.value();
  }

  Future<void> _onApplyFilters(
    ApplyFilters event,
    Emitter<CountriesState> emit,
  ) async {
    if (currentResponse == null) return;

    currentFilters = event.filters
        .copyWith(locale: currentFilters?.locale ?? event.filters.locale);

    final filteredCountries = currentResponse!.where((Country country) {
      bool matchesContinent = event.filters.continents == null ||
          (country.continents != null &&
              country.continents!.isNotEmpty &&
              event.filters.continents!.any(
                (continent) => continent == country.continents![0],
              ));

      bool matchesTimezone = event.filters.timezones == null ||
          (country.timezones != null &&
              country.timezones!.any((timezone) {
                return event.filters.timezones!.contains(timezone);
              }));

      return matchesContinent && matchesTimezone;
    }).toList();

    if (currentFilters?.locale != null) {
      final locale = currentFilters!.locale!;

      final translatedCountries = filteredCountries.map((Country country) {
        final translation = country.translations?[locale];
        if (translation != null) {
          return country.copyWith(
            name: NameModel(
              common: translation.common,
              official: translation.official,
              nativeName: country.name?.nativeName,
            ),
          );
        }
        return country;
      }).toList();

      emit(CountriesLoaded(translatedCountries, currentLocale: locale));
    } else {
      emit(CountriesLoaded(filteredCountries));
    }
  }

  Future<void> _onChangeLocale(
    ChangeLocale event,
    Emitter<CountriesState> emit,
  ) async {
    if (currentResponse == null) return;

    currentFilters =
        (currentFilters ?? CountryFilters()).copyWith(locale: event.locale);

    final translatedCountries = currentResponse!.map((country) {
      final translation = country.translations?[event.locale];
      if (translation != null) {
        return country.copyWith(
          name: NameModel(
            common: translation.common,
            official: translation.official,
            nativeName: country.name?.nativeName,
          ),
        );
      }
      return country;
    }).toList();

    emit(CountriesLoaded(
      translatedCountries,
      currentLocale: event.locale,
    ));
  }
}
