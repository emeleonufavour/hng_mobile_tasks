import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hng_2_task/core/core.dart';
import 'package:hng_2_task/features/features.dart';

class CountryFilterSheet extends StatefulWidget {
  const CountryFilterSheet({super.key});

  @override
  State<CountryFilterSheet> createState() => _CountryFilterSheetState();
}

class _CountryFilterSheetState extends State<CountryFilterSheet> {
  Set<String> selectedContinents = {};

  final continents = [
    'Africa',
    'Antarctica',
    'Asia',
    'Australia',
    'Europe',
    'North America',
    'South America',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  'Filter',
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          ExpansionTile(
            initiallyExpanded: true,
            iconColor: Theme.of(context).colorScheme.secondary,
            shape: RoundedRectangleBorder(
              side: BorderSide.none,
            ),
            clipBehavior: Clip.none,
            title: TextWidget(
              'Continent',
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
            ),
            children: continents.map((continent) {
              final isSelected = selectedContinents.contains(continent);
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    continent,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    textColor: Theme.of(context).checkboxTheme.side!.color,
                  ),
                  Checkbox.adaptive(
                      value: isSelected,
                      onChanged: (v) {
                        setState(() {
                          if (isSelected) {
                            selectedContinents.remove(continent);
                          } else {
                            selectedContinents.add(continent);
                          }
                        });
                      }),
                ],
              ).padding(horizontal: 16.w);
            }).toList(),
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        selectedContinents.clear();
                      });
                      context.read<CountriesBloc>().add(
                            ApplyFilters(
                              CountryFilters(
                                continents: selectedContinents.isEmpty
                                    ? null
                                    : selectedContinents.toList(),
                              ),
                            ),
                          );
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            color:
                                Theme.of(context).textTheme.bodyLarge!.color!),
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4))),
                    child: TextWidget(
                      'Reset',
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      textColor: Theme.of(context).textTheme.bodyLarge!.color,
                    ),
                  ),
                ),
                30.w.horizontalSpace,
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<CountriesBloc>().add(
                            ApplyFilters(
                              CountryFilters(
                                continents: selectedContinents.isEmpty
                                    ? null
                                    : selectedContinents.toList(),
                              ),
                            ),
                          );
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4))),
                    child: TextWidget(
                      'Show results',
                      fontWeight: FontWeight.w400,
                      textColor: Palette.white,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
