import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hng_2_task/core/core.dart';
import 'package:hng_2_task/features/features.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class CountryProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    Provider<Dio>(
      create: (context) => Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          headers: {
            'Accept': 'application/json',
          },
        ),
      ),
    ),
    Provider<CountryRemoteDatasource>(
      create: (context) => CountryRemoteDatasourceImpl(
        dio: context.read<Dio>(),
      ),
    ),
    Provider<CountryRepository>(
      create: (context) => CountryRepoImpl(
        countryRemoteDatasource: context.read<CountryRemoteDatasource>(),
      ),
    ),
    BlocProvider(
      create: (context) => CountriesBloc(
        context.read<CountryRepository>(),
      )..add(GetCountries()),
    ),
  ];
}
