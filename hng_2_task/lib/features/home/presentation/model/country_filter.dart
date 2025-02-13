class CountryFilters {
  final List<String>? continents;

  const CountryFilters({this.continents});

  CountryFilters copyWith({List<String>? continents}) {
    return CountryFilters(
      continents: continents ?? this.continents,
    );
  }
}
