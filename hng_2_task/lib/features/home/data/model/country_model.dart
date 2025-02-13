import 'package:hng_2_task/features/features.dart';

class CountryModel extends Country {
  const CountryModel({
    required super.name,
    required super.fullName,
    required super.capital,
    required super.iso2,
    required super.iso3,
    required super.covid19,
    required super.currentPresident,
    required super.currency,
    required super.phoneCode,
    required super.continent,
    required super.description,
    required super.size,
    required super.independenceDate,
    required super.population,
    required super.href,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name'] as String?,
      fullName: json['full_name'] as String?,
      capital: json['capital'] as String?,
      iso2: json['iso2'] as String?,
      iso3: json['iso3'] as String?,
      covid19: json['covid19'] != null
          ? Covid19Info(
              totalCase: json['covid19']['total_case'] as String?,
              totalDeaths: json['covid19']['total_deaths'] as String?,
              lastUpdated: json['covid19']['last_updated'] as String?,
            )
          : null,
      currentPresident: json['current_president'] != null
          ? President(
              name: json['current_president']['name'] as String?,
              gender: json['current_president']['gender'] as String?,
              appointmentStartDate: json['current_president']
                  ['appointment_start_date'] as String?,
              appointmentEndDate:
                  json['current_president']['appointment_end_date'] as String?,
              href: json['current_president']['href'] != null
                  ? PresidentHref(
                      self:
                          json['current_president']['href']['self'] as String?,
                      country: json['current_president']['href']['country']
                          as String?,
                      picture: json['current_president']['href']['picture']
                          as String?,
                    )
                  : null,
            )
          : null,
      currency: json['currency'] as String?,
      phoneCode: json['phone_code'] as String?,
      continent: json['continent'] as String?,
      description: json['description'] as String?,
      size: json['size'] as String?,
      independenceDate: json['independence_date'] as String?,
      population: json['population'] as String?,
      href: json['href'] != null
          ? CountryHref(
              self: json['href']['self'] as String?,
              states: json['href']['states'] as String?,
              presidents: json['href']['presidents'] as String?,
              flag: json['href']['flag'] as String?,
            )
          : null,
    );
  }
}
