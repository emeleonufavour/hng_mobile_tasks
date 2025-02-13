import 'package:equatable/equatable.dart';

class Country extends Equatable {
  final String? name;
  final String? fullName;
  final String? capital;
  final String? iso2;
  final String? iso3;
  final Covid19Info? covid19;
  final President? currentPresident;
  final String? currency;
  final String? phoneCode;
  final String? continent;
  final String? description;
  final String? size;
  final String? independenceDate;
  final String? population;
  final CountryHref? href;

  const Country({
    this.name,
    this.fullName,
    this.capital,
    this.iso2,
    this.iso3,
    this.covid19,
    this.currentPresident,
    this.currency,
    this.phoneCode,
    this.continent,
    this.description,
    this.size,
    this.independenceDate,
    this.population,
    this.href,
  });

  @override
  String toString() {
    return 'Country(name: $name, fullName: $fullName, capital: $capital, iso2: $iso2, iso3: $iso3, covid19: $covid19, currentPresident: $currentPresident, currency: $currency, phoneCode: $phoneCode, continent: $continent, description: $description, size: $size, independenceDate: $independenceDate, population: $population, href: $href)';
  }

  @override
  List<Object?> get props => [
        name,
        fullName,
        capital,
        iso2,
        iso3,
        phoneCode,
        continent,
        independenceDate,
        population
      ];
}

class Covid19Info {
  final String? totalCase;
  final String? totalDeaths;
  final String? lastUpdated;

  Covid19Info({
    this.totalCase,
    this.totalDeaths,
    this.lastUpdated,
  });

  @override
  String toString() =>
      'Covid19Info(totalCase: $totalCase, totalDeaths: $totalDeaths, lastUpdated: $lastUpdated)';
}

class President {
  final String? name;
  final String? gender;
  final String? appointmentStartDate;
  final String? appointmentEndDate;
  final PresidentHref? href;

  President({
    this.name,
    this.gender,
    this.appointmentStartDate,
    this.appointmentEndDate,
    this.href,
  });

  @override
  String toString() {
    return 'President(name: $name, gender: $gender, appointmentStartDate: $appointmentStartDate, appointmentEndDate: $appointmentEndDate, href: $href)';
  }
}

class PresidentHref {
  final String? self;
  final String? country;
  final String? picture;

  PresidentHref({
    this.self,
    this.country,
    this.picture,
  });

  @override
  String toString() =>
      'PresidentHref(self: $self, country: $country, picture: $picture)';
}

class CountryHref {
  final String? self;
  final String? states;
  final String? presidents;
  final String? flag;

  CountryHref({
    this.self,
    this.states,
    this.presidents,
    this.flag,
  });

  @override
  String toString() {
    return 'CountryHref(self: $self, states: $states, presidents: $presidents, flag: $flag)';
  }
}
