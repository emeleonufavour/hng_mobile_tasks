import 'package:equatable/equatable.dart';

class Country extends Equatable {
  final Name? name;
  final List<String>? capital;
  final List<String>? tld;
  final String? cca2;
  final String? ccn3;
  final String? cca3;
  final bool? independent;
  final String? status;
  final bool? unMember;
  final Map<String, Currency>? currencies;
  final Idd? idd;
  final List<String>? altSpellings;
  final String? region;
  final Map<String, String>? languages;
  final Map<String, Translation>? translations;
  final List<double>? latlng;
  final bool? landlocked;
  final double? area;
  final Demonyms? demonyms;
  final String? flag;
  final Maps? maps;
  final int? population;
  final Car? car;
  final List<String>? timezones;
  final List<String>? continents;
  final Flags? flags;
  final CoatOfArms? coatOfArms;
  final String? startOfWeek;
  final CapitalInfo? capitalInfo;

  const Country({
    this.name,
    this.capital,
    this.tld,
    this.cca2,
    this.ccn3,
    this.cca3,
    this.independent,
    this.status,
    this.unMember,
    this.currencies,
    this.idd,
    this.altSpellings,
    this.region,
    this.languages,
    this.translations,
    this.latlng,
    this.landlocked,
    this.area,
    this.demonyms,
    this.flag,
    this.maps,
    this.population,
    this.car,
    this.timezones,
    this.continents,
    this.flags,
    this.coatOfArms,
    this.startOfWeek,
    this.capitalInfo,
  });

  @override
  List<Object?> get props => [
        name,
        capital,
        tld,
        cca2,
        ccn3,
        cca3,
        independent,
        status,
        unMember,
        currencies,
        idd,
        altSpellings,
        region,
        languages,
        translations,
        latlng,
        landlocked,
        area,
        demonyms,
        flag,
        maps,
        population,
        car,
        timezones,
        continents,
        flags,
        coatOfArms,
        startOfWeek,
        capitalInfo,
      ];

  Country copyWith({
    Name? name,
    List<String>? capital,
    List<String>? tld,
    String? cca2,
    String? ccn3,
    String? cca3,
    bool? independent,
    String? status,
    bool? unMember,
    Map<String, Currency>? currencies,
    Idd? idd,
    List<String>? altSpellings,
    String? region,
    Map<String, String>? languages,
    Map<String, Translation>? translations,
    List<double>? latlng,
    bool? landlocked,
    double? area,
    Demonyms? demonyms,
    String? flag,
    Maps? maps,
    int? population,
    Car? car,
    List<String>? timezones,
    List<String>? continents,
    Flags? flags,
    CoatOfArms? coatOfArms,
    String? startOfWeek,
    CapitalInfo? capitalInfo,
  }) {
    return Country(
      name: name ?? this.name,
      capital: capital ?? this.capital,
      tld: tld ?? this.tld,
      cca2: cca2 ?? this.cca2,
      ccn3: ccn3 ?? this.ccn3,
      cca3: cca3 ?? this.cca3,
      independent: independent ?? this.independent,
      status: status ?? this.status,
      unMember: unMember ?? this.unMember,
      currencies: currencies ?? this.currencies,
      idd: idd ?? this.idd,
      altSpellings: altSpellings ?? this.altSpellings,
      region: region ?? this.region,
      languages: languages ?? this.languages,
      translations: translations ?? this.translations,
      latlng: latlng ?? this.latlng,
      landlocked: landlocked ?? this.landlocked,
      area: area ?? this.area,
      demonyms: demonyms ?? this.demonyms,
      flag: flag ?? this.flag,
      maps: maps ?? this.maps,
      population: population ?? this.population,
      car: car ?? this.car,
      timezones: timezones ?? this.timezones,
      continents: continents ?? this.continents,
      flags: flags ?? this.flags,
      coatOfArms: coatOfArms ?? this.coatOfArms,
      startOfWeek: startOfWeek ?? this.startOfWeek,
      capitalInfo: capitalInfo ?? this.capitalInfo,
    );
  }
}

class Name extends Equatable {
  final String? common;
  final String? official;
  final Map<String, NativeName>? nativeName;

  const Name({
    this.common,
    this.official,
    this.nativeName,
  });

  @override
  List<Object?> get props => [common, official, nativeName];
}

class NativeName extends Equatable {
  final String? official;
  final String? common;

  const NativeName({
    this.official,
    this.common,
  });

  @override
  List<Object?> get props => [official, common];
}

class Currency extends Equatable {
  final String? name;
  final String? symbol;

  const Currency({
    this.name,
    this.symbol,
  });

  @override
  List<Object?> get props => [name, symbol];
}

class Idd extends Equatable {
  final String? root;
  final List<String>? suffixes;

  const Idd({
    this.root,
    this.suffixes,
  });

  @override
  List<Object?> get props => [root, suffixes];
}

class Translation extends Equatable {
  final String? official;
  final String? common;

  const Translation({
    this.official,
    this.common,
  });

  @override
  List<Object?> get props => [official, common];
}

class Demonyms extends Equatable {
  final DemonymsGender? eng;
  final DemonymsGender? fra;

  const Demonyms({
    this.eng,
    this.fra,
  });

  @override
  List<Object?> get props => [eng, fra];
}

class DemonymsGender extends Equatable {
  final String? f;
  final String? m;

  const DemonymsGender({
    this.f,
    this.m,
  });

  @override
  List<Object?> get props => [f, m];
}

class Maps extends Equatable {
  final String? googleMaps;
  final String? openStreetMaps;

  const Maps({
    this.googleMaps,
    this.openStreetMaps,
  });

  @override
  List<Object?> get props => [googleMaps, openStreetMaps];
}

class Car extends Equatable {
  final List<String>? signs;
  final String? side;

  const Car({
    this.signs,
    this.side,
  });

  @override
  List<Object?> get props => [signs, side];
}

class Flags extends Equatable {
  final String? png;
  final String? svg;

  const Flags({
    this.png,
    this.svg,
  });

  @override
  List<Object?> get props => [png, svg];
}

class CoatOfArms extends Equatable {
  final String? png;
  final String? svg;

  const CoatOfArms({
    this.png,
    this.svg,
  });

  @override
  List<Object?> get props => [png, svg];
}

class CapitalInfo extends Equatable {
  final List<double>? latlng;

  const CapitalInfo({
    this.latlng,
  });

  @override
  List<Object?> get props => [latlng];
}

class NameModel extends Name {
  const NameModel({
    super.common,
    super.official,
    super.nativeName,
  });

  factory NameModel.fromJson(Map<String, dynamic> json) {
    return NameModel(
      common: json['common'] as String?,
      official: json['official'] as String?,
      nativeName: (json['nativeName'] as Map<String, dynamic>?)?.map(
        (key, value) => MapEntry(
          key,
          NativeNameModel.fromJson(value),
        ),
      ),
    );
  }
}

class NativeNameModel extends NativeName {
  const NativeNameModel({
    super.official,
    super.common,
  });

  factory NativeNameModel.fromJson(Map<String, dynamic> json) {
    return NativeNameModel(
      official: json['official'] as String?,
      common: json['common'] as String?,
    );
  }
}

class CurrencyModel extends Currency {
  const CurrencyModel({
    super.name,
    super.symbol,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
    );
  }
}

class IddModel extends Idd {
  const IddModel({
    super.root,
    super.suffixes,
  });

  factory IddModel.fromJson(Map<String, dynamic> json) {
    return IddModel(
      root: json['root'] as String?,
      suffixes: (json['suffixes'] as List<dynamic>?)?.cast<String>(),
    );
  }
}

class TranslationModel extends Translation {
  const TranslationModel({
    super.official,
    super.common,
  });

  factory TranslationModel.fromJson(Map<String, dynamic> json) {
    return TranslationModel(
      official: json['official'] as String?,
      common: json['common'] as String?,
    );
  }
}

class DemonymsModel extends Demonyms {
  const DemonymsModel({
    super.eng,
    super.fra,
  });

  factory DemonymsModel.fromJson(Map<String, dynamic> json) {
    return DemonymsModel(
      eng: json['eng'] != null
          ? DemonymsGenderModel.fromJson(json['eng'])
          : null,
      fra: json['fra'] != null
          ? DemonymsGenderModel.fromJson(json['fra'])
          : null,
    );
  }
}

class DemonymsGenderModel extends DemonymsGender {
  const DemonymsGenderModel({
    super.f,
    super.m,
  });

  factory DemonymsGenderModel.fromJson(Map<String, dynamic> json) {
    return DemonymsGenderModel(
      f: json['f'] as String?,
      m: json['m'] as String?,
    );
  }
}

class MapsModel extends Maps {
  const MapsModel({
    super.googleMaps,
    super.openStreetMaps,
  });

  factory MapsModel.fromJson(Map<String, dynamic> json) {
    return MapsModel(
      googleMaps: json['googleMaps'] as String?,
      openStreetMaps: json['openStreetMaps'] as String?,
    );
  }
}

class CarModel extends Car {
  const CarModel({
    super.signs,
    super.side,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      signs: (json['signs'] as List<dynamic>?)?.cast<String>(),
      side: json['side'] as String?,
    );
  }
}

class FlagsModel extends Flags {
  const FlagsModel({
    super.png,
    super.svg,
  });

  factory FlagsModel.fromJson(Map<String, dynamic> json) {
    return FlagsModel(
      png: json['png'] as String?,
      svg: json['svg'] as String?,
    );
  }
}

class CoatOfArmsModel extends CoatOfArms {
  const CoatOfArmsModel({
    super.png,
    super.svg,
  });

  factory CoatOfArmsModel.fromJson(Map<String, dynamic> json) {
    return CoatOfArmsModel(
      png: json['png'] as String?,
      svg: json['svg'] as String?,
    );
  }
}

class CapitalInfoModel extends CapitalInfo {
  const CapitalInfoModel({
    super.latlng,
  });

  factory CapitalInfoModel.fromJson(Map<String, dynamic> json) {
    return CapitalInfoModel(
      latlng: (json['latlng'] as List<dynamic>?)?.cast<double>(),
    );
  }
}
