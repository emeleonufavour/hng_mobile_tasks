import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hng_2_task/core/core.dart';
import 'package:hng_2_task/features/features.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class CountryProviders {
  static Future<List<SingleChildWidget>> createProviders() async {
    final config = await EnvConfig.initialize();

    return [
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      Provider<EnvConfig>.value(value: config),
      Provider<Dio>(
        create: (context) => Dio(
          BaseOptions(
            baseUrl: ApiConstants.baseUrl,
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer ${context.read<EnvConfig>().apiToken}'
            },
          ),
        ),
      ),
      Provider<CountryRemoteDatasource>(
        create: (context) => CountryRemoteDatasourceImpl(
          dio: context.read<Dio>(),
        ),
      ),
      Provider<StateRemoteDatasource>(
          create: (context) =>
              StateRemoteDatasourceImpl(dio: context.read<Dio>())),
      Provider<CountryRepository>(
        create: (context) => CountryRepoImpl(
          countryRemoteDatasource: context.read<CountryRemoteDatasource>(),
        ),
      ),
      Provider<StateRepository>(
          create: (context) => StateRepoImpl(
              stateRemoteDatasource: context.read<StateRemoteDatasource>())),
      BlocProvider(
        create: (context) => CountriesBloc(
          context.read<CountryRepository>(),
        )..add(GetCountries()),
      ),
      BlocProvider(
          create: (context) => StatesBloc(context.read<StateRepository>()))
    ];
  }
}
