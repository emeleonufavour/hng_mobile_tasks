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
            country.name ?? "No name provided",
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
                tag: country.href!.flag!,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: ImageWidget(
                      height: 200.h,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                      url: country.href!.flag!),
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (country.population != null)
                  _CountryDetail(
                    title: "Population: ",
                    info: country.population!,
                  ),
                if (country.capital != null)
                  _CountryDetail(
                      title: "Capital city: ", info: country.capital!),
                if (country.currentPresident?.name != null)
                  _CountryDetail(
                      title: "Current President: ",
                      info: country.currentPresident!.name!),
                if (country.continent != null)
                  _CountryDetail(
                      title: "Continent: ", info: country.continent!),
                if (country.phoneCode != null)
                  _CountryDetail(
                      title: "Country code: ", info: country.phoneCode!),
                if (country.href?.states != null)
                  StatesSection(countryId: country.iso2 ?? '')
              ].separate(5.h.verticalSpace),
            ).padding(vertical: 20.h),
          ],
        ),
        useSingleScroll: true);
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
