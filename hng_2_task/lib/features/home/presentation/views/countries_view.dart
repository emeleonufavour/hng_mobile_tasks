import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hng_2_task/core/core.dart';
import 'package:hng_2_task/features/features.dart';

class CountriesView extends StatelessWidget {
  const CountriesView({super.key});

  static const route = "/countries_view";

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body:
          BlocBuilder<CountriesBloc, CountriesState>(builder: (context, state) {
        if (state is CountriesError) {
          return RefreshIndicator.adaptive(
            onRefresh: () async {
              context.read<CountriesBloc>().add(GetCountries());
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Center(
                child: Column(
                  children: [
                    TextWidget("Uh oh! We could not get the countries for you"),
                    5.h.verticalSpace,
                    TextWidget("Pull this screen down, let's try again!"),
                  ],
                ),
              ),
            ),
          );
        }
        if (state is CountriesLoading) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator.adaptive(
                strokeWidth: 1,
              ),
              10.h.verticalSpace,
              TextWidget("Hold on, we are getting those countries.."),
            ],
          ));
        }
        if (state is CountriesLoaded) {
          return RefreshIndicator.adaptive(
            onRefresh: () async {
              context.read<CountriesBloc>().add(GetCountries());
            },
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Explore',
                          style: GoogleFonts.gloock(
                              fontSize: 35.sp, fontWeight: FontWeight.bold),
                        ),
                        CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          radius: 4.w,
                        ).padding(bottom: 10.h)
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          shape: BoxShape.circle),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: IconButton(
                          key: ValueKey(
                              context.watch<ThemeProvider>().isDarkMode),
                          onPressed: () =>
                              context.read<ThemeProvider>().toggleTheme(),
                          icon: Icon(context.watch<ThemeProvider>().isDarkMode
                              ? Icons.dark_mode_outlined
                              : Icons.wb_sunny_outlined),
                        ),
                      ),
                    ),
                  ],
                ),
                15.h.verticalSpace,
                CountrySearchBar(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [LocalBox(), FilterBox()],
                ).padding(top: 15.h, bottom: 10.h),
                Expanded(
                  child: GroupedCountryList(
                    countryList: state.response.data,
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      }),
      useSingleScroll: false,
    );
  }
}
