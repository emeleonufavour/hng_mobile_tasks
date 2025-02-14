import 'package:flutter/material.dart';
import 'package:hng_2_task/core/core.dart';
import 'package:hng_2_task/features/features.dart';

class CountryDetailsView extends StatelessWidget {
  final Country country;
  const CountryDetailsView({required this.country, super.key});

  static const route = "/country_details_view";

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        title: TextWidget(
          country.name?.common ?? "No country name",
          fontWeight: FontWeight.w700,
          fontSize: 16.sp,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CountryImagesCarousel(
            flagUrl: country.flags!.png!,
            coatOfArmsUrl: country.coatOfArms?.png,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CountryDetail(
                title: "Population: ",
                info: country.population.toString(),
              ),
              if (country.region != null)
                _CountryDetail(
                  title: "Region: ",
                  info: country.region!,
                ),
              if (country.capital != null && country.capital!.isNotEmpty)
                _CountryDetail(
                  title: "Capital: ",
                  info: country.capital!.first,
                ),
              if (country.flag != null)
                _CountryDetail(title: "Flag: ", info: country.flag!),
              18.h.verticalSpace,
              if (country.languages != null && country.languages!.isNotEmpty)
                _CountryDetail(
                  title: "Languages: ",
                  info: country.languages!.values.join(", "),
                ),
              if (country.currencies != null && country.currencies!.isNotEmpty)
                _CountryDetail(
                  title: "Currency: ",
                  info: country.currencies!.entries.first.value.name!,
                ),
              if (country.continents != null && country.continents!.isNotEmpty)
                _CountryDetail(
                    title: "Continent: ", info: country.continents!.join(", ")),
              if (country.startOfWeek != null)
                _CountryDetail(
                    title: "Start of week: ", info: country.startOfWeek!),
              18.h.verticalSpace,
              if (country.independent != null)
                _CountryDetail(
                    title: "Independent: ",
                    info: country.independent.toString()),
              if (country.area != null)
                _CountryDetail(title: "Area: ", info: country.area.toString()),
              if (country.timezones != null && country.timezones!.isNotEmpty)
                _CountryDetail(
                    title: "Timezone: ", info: country.timezones!.join(", ")),
              if (country.car?.side != null)
                _CountryDetail(
                    title: "Driving side: ", info: country.car!.side!)
            ].separate(5.h.verticalSpace),
          ).padding(vertical: 20.h),
        ],
      ),
      useSingleScroll: true,
    );
  }
}

class _CountryDetail extends StatelessWidget {
  final String title;
  final String info;
  const _CountryDetail({required this.title, required this.info, super.key});

  @override
  Widget build(BuildContext context) {
    return RichTextWidget(
      text: title,
      text2: info,
      fontWeight: FontWeight.w500,
      fontWeight2: FontWeight.w300,
    );
  }
}
