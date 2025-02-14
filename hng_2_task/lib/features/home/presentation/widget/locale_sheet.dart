import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hng_2_task/core/core.dart';
import 'package:hng_2_task/features/features.dart';

class LocaleBottomSheet extends StatelessWidget {
  const LocaleBottomSheet({super.key});

  static const Map<String, String> languageNames = {
    'ara': 'Arabic',
    'bre': 'Breton',
    'ces': 'Czech',
    'cym': 'Welsh',
    'deu': 'German',
    'est': 'Estonian',
    'fin': 'Finnish',
    'fra': 'French',
    'hrv': 'Croatian',
    'hun': 'Hungarian',
    'ita': 'Italian',
    'jpn': 'Japanese',
    'kor': 'Korean',
    'nld': 'Dutch',
    'per': 'Persian',
    'pol': 'Polish',
    'por': 'Portuguese',
    'rus': 'Russian',
    'slk': 'Slovak',
    'spa': 'Spanish',
    'srp': 'Serbian',
    'swe': 'Swedish',
    'tur': 'Turkish',
    'urd': 'Urdu',
    'zho': 'Chinese',
  };

  @override
  Widget build(BuildContext context) {
    final country = context.read<CountriesBloc>().currentResponse?.firstOrNull;
    final translations = country?.translations?.keys.toList() ?? [];
    final selectedLocale = context.watch<CountriesBloc>().state.currentLocale;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                'Languages',
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
              ),
              BottomSheetBackButton(),
            ],
          ).padding(all: 16.w),
          SizedBox(
            height: 500.h,
            child: ListView.builder(
              itemCount: translations.length,
              itemBuilder: (context, index) {
                final languageCode = translations[index];
                final languageName =
                    languageNames[languageCode] ?? languageCode;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      languageName,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                    ),
                    Radio.adaptive(
                        value: languageCode,
                        groupValue: selectedLocale,
                        onChanged: (v) {
                          context
                              .read<CountriesBloc>()
                              .add(ChangeLocale(languageCode));
                          goBack();
                        })
                  ],
                ).padding(left: 16.w, right: 5.w);
              },
            ),
          ),
        ],
      ),
    );
  }
}
