import 'package:flutter/material.dart';
import 'package:hng_2_task/core/core.dart';
import 'package:hng_2_task/features/features.dart';

class FilterBox extends StatelessWidget {
  const FilterBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => const CountryFilterSheet(),
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
          children: [
            Icon(Icons.filter_alt_outlined,
                color: Theme.of(context).colorScheme.tertiary),
            4.w.horizontalSpace,
            TextWidget(
              "Filter",
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              textColor: Theme.of(context).colorScheme.tertiary,
            )
          ],
        ),
      ),
    );
  }
}
