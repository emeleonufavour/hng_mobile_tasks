import 'package:hng_2_task/features/features.dart';

class CountryModel extends Country {
  const CountryModel({
    super.name,
    super.capital,
    super.tld,
    super.cca2,
    super.ccn3,
    super.cca3,
    super.independent,
    super.status,
    super.unMember,
    super.currencies,
    super.idd,
    super.altSpellings,
    super.region,
    super.languages,
    super.translations,
    super.latlng,
    super.landlocked,
    super.area,
    super.demonyms,
    super.flag,
    super.maps,
    super.population,
    super.car,
    super.timezones,
    super.continents,
    super.flags,
    super.coatOfArms,
    super.startOfWeek,
    super.capitalInfo,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name'] != null ? NameModel.fromJson(json['name']) : null,
      capital: (json['capital'] as List<dynamic>?)?.cast<String>(),
      tld: (json['tld'] as List<dynamic>?)?.cast<String>(),
      cca2: json['cca2'] as String?,
      ccn3: json['ccn3'] as String?,
      cca3: json['cca3'] as String?,
      independent: json['independent'] as bool?,
      status: json['status'] as String?,
      unMember: json['unMember'] as bool?,
      currencies: (json['currencies'] as Map<String, dynamic>?)?.map(
        (key, value) => MapEntry(
          key,
          CurrencyModel.fromJson(value),
        ),
      ),
      idd: json['idd'] != null ? IddModel.fromJson(json['idd']) : null,
      altSpellings: (json['altSpellings'] as List<dynamic>?)?.cast<String>(),
      region: json['region'] as String?,
      languages:
          (json['languages'] as Map<String, dynamic>?)?.cast<String, String>(),
      translations: (json['translations'] as Map<String, dynamic>?)?.map(
        (key, value) => MapEntry(
          key,
          TranslationModel.fromJson(value),
        ),
      ),
      latlng: (json['latlng'] as List<dynamic>?)?.cast<double>(),
      landlocked: json['landlocked'] as bool?,
      area: json['area']?.toDouble(),
      demonyms: json['demonyms'] != null
          ? DemonymsModel.fromJson(json['demonyms'])
          : null,
      flag: json['flag'] as String?,
      maps: json['maps'] != null ? MapsModel.fromJson(json['maps']) : null,
      population: json['population'] as int?,
      car: json['car'] != null ? CarModel.fromJson(json['car']) : null,
      timezones: (json['timezones'] as List<dynamic>?)?.cast<String>(),
      continents: (json['continents'] as List<dynamic>?)?.cast<String>(),
      flags: json['flags'] != null ? FlagsModel.fromJson(json['flags']) : null,
      coatOfArms: json['coatOfArms'] != null
          ? CoatOfArmsModel.fromJson(json['coatOfArms'])
          : null,
      startOfWeek: json['startOfWeek'] as String?,
      capitalInfo: json['capitalInfo'] != null
          ? CapitalInfoModel.fromJson(json['capitalInfo'])
          : null,
    );
  }
}
