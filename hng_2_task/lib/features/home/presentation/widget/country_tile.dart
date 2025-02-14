import 'package:flutter/material.dart';
import 'package:hng_2_task/core/core.dart';
import 'package:hng_2_task/features/features.dart';

class CountryTile extends StatelessWidget {
  final Country country;
  const CountryTile({required this.country, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Hero(
          tag: country.flags?.png ?? '',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: ImageWidget(
              fit: BoxFit.cover,
              height: 40.h,
              width: 40.w,
              url: country.flags?.png ?? "",
            ),
          ),
        ),
        10.w.horizontalSpace,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 200,
              child: Hero(
                tag: country.name?.common ?? "No name recorded",
                child: TextWidget(
                  country.name?.common ?? "No name recorded",
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  textColor: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            ),
            const SizedBox(height: 5),
            TextWidget(
              country.capital?.firstOrNull ?? 'No capital recorded',
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              textColor: Theme.of(context).colorScheme.secondary,
            ),
          ],
        )
      ],
    );
  }
}
