import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hng_2_task/core/core.dart';
import 'package:hng_2_task/features/features.dart';

class LocalBox extends StatelessWidget {
  const LocalBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => const LocaleBottomSheet(),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
            width: 0.3,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(CupertinoIcons.globe,
                color: Theme.of(context).colorScheme.tertiary),
            5.w.horizontalSpace,
            BlocBuilder<CountriesBloc, CountriesState>(
              builder: (context, state) {
                final locale =
                    (context.read<CountriesBloc>().currentFilters?.locale ??
                            'EN')
                        .toUpperCase();
                return TextWidget(
                  locale,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  textColor: Theme.of(context).colorScheme.tertiary,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
