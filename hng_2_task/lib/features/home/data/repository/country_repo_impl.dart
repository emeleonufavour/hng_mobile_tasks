import 'package:fpdart/fpdart.dart';
import 'package:hng_2_task/core/core.dart';
import 'package:hng_2_task/features/features.dart';

class CountryRepoImpl extends CountryRepository with RepositoryErrorHandler {
  final CountryRemoteDatasource countryRemoteDatasource;
  CountryRepoImpl({required this.countryRemoteDatasource});

  @override
  Future<Either<Failure, List<Country>>> getCountries(
      {int? page, int? perPage}) async {
    return callAction(() => countryRemoteDatasource.getCountries());
  }
}
