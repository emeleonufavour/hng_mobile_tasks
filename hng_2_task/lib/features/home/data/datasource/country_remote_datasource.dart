import 'package:dio/dio.dart';
import 'package:hng_2_task/core/core.dart';
import 'package:hng_2_task/features/features.dart';

abstract interface class CountryRemoteDatasource {
  Future<PaginatedResponse<Country>> getCountries({
    int? page,
    int? perPage,
  });
}

class CountryRemoteDatasourceImpl extends CountryRemoteDatasource {
  final Dio dio;

  CountryRemoteDatasourceImpl({required this.dio});

  @override
  Future<PaginatedResponse<Country>> getCountries(
      {int? page, int? perPage}) async {
    try {
      final response = await dio.get(ApiConstants.countries, queryParameters: {
        'page': page,
        'per_page': perPage,
      });

      final data = response.data;
      if (data == null) {
        throw BaseFailures(message: 'Response data is null');
      }

      final dataList = data['data'];
      if (dataList == null || dataList is! List) {
        throw BaseFailures(message: 'Invalid or missing data format');
      }

      final List<Country> countries = dataList
          .map((json) => CountryModel.fromJson(Map<String, dynamic>.from(json)))
          .toList();

      AppLogger.log("Countries: $countries");

      return PaginatedResponse(
        data: countries,
        links: data['links'] != null
            ? PaginationLinks.fromJson(data['links'])
            : PaginationLinks.fromJson({}),
        meta: data['meta'] != null
            ? PaginationMeta.fromJson(data['meta'])
            : PaginationMeta.fromJson({}),
      );
    } catch (e) {
      AppLogger.log("Error in getCountries: $e");
      throw BaseFailures(message: e.toString());
    }
  }
}
