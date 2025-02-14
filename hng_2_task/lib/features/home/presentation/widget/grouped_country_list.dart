import 'package:flutter/material.dart';
import 'package:hng_2_task/core/core.dart';
import 'package:hng_2_task/features/features.dart';

class GroupedCountryList extends StatelessWidget {
  final List<Country> countryList;

  const GroupedCountryList({required this.countryList, super.key});

  Map<String, List<Country>> _groupCountries(List<Country> countryList) {
    final groupedMap = <String, List<Country>>{};

    final sortedCountries = List<Country>.from(countryList)
      ..sort((a, b) => (a.name?.common ?? '').compareTo(b.name?.common ?? ''));

    for (var country in sortedCountries) {
      final name = country.name?.common;
      if (name == null || name.isEmpty) continue;

      final firstLetter = name[0].toUpperCase();
      if (!groupedMap.containsKey(firstLetter)) {
        groupedMap[firstLetter] = [];
      }
      groupedMap[firstLetter]!.add(country);
    }

    return Map.fromEntries(
        groupedMap.entries.toList()..sort((a, b) => a.key.compareTo(b.key)));
  }

  @override
  Widget build(BuildContext context) {
    final groupedCountries = _groupCountries(countryList);

    return ListView.builder(
      itemCount: groupedCountries.length,
      itemBuilder: (context, index) {
        final letter = groupedCountries.keys.elementAt(index);
        final countries = groupedCountries[letter]!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: TextWidget(
                letter,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                textColor: Theme.of(context).colorScheme.secondary,
              ),
            ),
            ...countries.map((country) => GestureDetector(
                  onTap: () {
                    goTo(CountryDetailsView.route, arguments: country);
                  },
                  child: CountryTile(country: country),
                ).padding(vertical: 10.h)),
          ],
        );
      },
    );
  }
}
