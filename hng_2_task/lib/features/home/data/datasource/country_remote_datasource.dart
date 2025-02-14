import 'package:dio/dio.dart';
import 'package:hng_2_task/core/core.dart';
import 'package:hng_2_task/features/features.dart';

abstract interface class CountryRemoteDatasource {
  Future<List<Country>> getCountries();
}

class CountryRemoteDatasourceImpl extends CountryRemoteDatasource {
  final Dio dio;

  CountryRemoteDatasourceImpl({required this.dio});

  @override
  Future<List<Country>> getCountries() async {
    try {
      final response = await dio.get(ApiConstants.countries);

      final data = response.data;
      if (data == null) {
        throw BaseFailures(message: 'Response data is null');
      }

      if (data is! List) {
        throw BaseFailures(message: 'Invalid or missing data format');
      }

      final List<Country> countries = data
          .map<Country>(
              (json) => CountryModel.fromJson(Map<String, dynamic>.from(json)))
          .toList();

      AppLogger.log("Countries: ${countries[0]}");

      return countries;
    } catch (e, stackTrace) {
      AppLogger.log("Error in getCountries: $e\n$stackTrace");
      throw BaseFailures(message: e.toString());
    }
  }
}
