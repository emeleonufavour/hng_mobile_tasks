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
  Set<String> selectedTimezones = {};

  final continents = [
    'Africa',
    'Antarctica',
    'Asia',
    'Australia',
    'Europe',
    'North America',
    'South America',
  ];

  final timezones = [
    'UTC-12:00',
    'UTC-11:00',
    'UTC-10:00',
    'UTC-9:30',
    'UTC-9:00',
    'UTC-8:00',
    'UTC-7:00',
    'UTC-6:00',
    'UTC-5:00',
    'UTC-4:30',
    'UTC-4:00',
    'UTC-3:30',
    'UTC-3:00',
    'UTC-2:00',
    'UTC-1:00',
    'UTC+0:00',
    'UTC+1:00',
    'UTC+2:00',
    'UTC+3:00',
    'UTC+3:30',
    'UTC+4:00',
    'UTC+4:30',
    'UTC+5:00',
    'UTC+5:30',
    'UTC+5:45',
    'UTC+6:00',
    'UTC+6:30',
    'UTC+7:00',
    'UTC+8:00',
    'UTC+8:45',
    'UTC+9:00',
    'UTC+9:30',
    'UTC+10:00',
    'UTC+10:30',
    'UTC+11:00',
    'UTC+12:00',
    'UTC+12:45',
    'UTC+13:00',
    'UTC+14:00',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
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
                BottomSheetBackButton()
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
              ).padding(left: 16.w, right: 12.w);
            }).toList(),
          ),
          ExpansionTile(
            initiallyExpanded: false,
            iconColor: Theme.of(context).colorScheme.secondary,
            shape: const RoundedRectangleBorder(
              side: BorderSide.none,
            ),
            clipBehavior: Clip.none,
            title: TextWidget(
              'Timezone',
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
            ),
            children: [
              SizedBox(
                height: (size.height * .2),
                child: ListView(
                  children: timezones.map((timezone) {
                    final isSelected = selectedTimezones.contains(timezone);
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          timezone,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          textColor:
                              Theme.of(context).checkboxTheme.side!.color,
                        ),
                        Checkbox.adaptive(
                          value: isSelected,
                          onChanged: (v) {
                            setState(() {
                              if (isSelected) {
                                selectedTimezones.remove(timezone);
                              } else {
                                selectedTimezones.add(timezone);
                              }
                            });
                          },
                        ),
                      ],
                    ).padding(left: 16.w, right: 12.w);
                  }).toList(),
                ),
              ),
            ],
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
                                timezones: selectedTimezones.isEmpty
                                    ? null
                                    : selectedTimezones.toList(),
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
