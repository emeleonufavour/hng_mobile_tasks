import 'package:flutter/material.dart';
import 'package:hng_2_task/core/core.dart';
import 'package:hng_2_task/features/features.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class CountryApp extends StatelessWidget {
  final List<SingleChildWidget> providers;
  const CountryApp({required this.providers, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Country',
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.generateRoute,
            navigatorKey: navigatorKey,
            theme: CountryAppTheme.lightTheme,
            darkTheme: CountryAppTheme.darkTheme,
            themeMode:
                themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            initialRoute: CountriesView.route,
            builder: (context, child) {
              final mediaQueryData = MediaQuery.of(context);
              final scale = mediaQueryData.textScaler.clamp(
                minScaleFactor: 0.85,
                maxScaleFactor: .99,
              );
              final pixelRatio =
                  mediaQueryData.devicePixelRatio.clamp(1.0, 4.0);
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: scale,
                  devicePixelRatio: pixelRatio,
                ),
                child: Overlay(
                  initialEntries: [
                    OverlayEntry(
                      builder: (context) => child!,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
