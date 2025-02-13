import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hng_2_task/core/core.dart';
import 'package:hng_2_task/features/features.dart';

class CountrySearchBar extends StatelessWidget {
  const CountrySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      height: 48.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: Assets.axirforma,
          fontWeight: FontWeight.w300,
          color: Theme.of(context).textTheme.bodyLarge?.color,
        ),
        decoration: InputDecoration(
          icon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.surfaceDim,
          ),
          border: InputBorder.none,
          hintText: 'Search Country',
          hintStyle: TextStyle(
            fontFamily: Assets.axirforma,
            fontWeight: FontWeight.w300,
            color: Theme.of(context).colorScheme.surfaceDim,
          ),
        ),
        onChanged: (value) =>
            context.read<CountriesBloc>().add(SearchCountries(value)),
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
