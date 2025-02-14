import 'package:fpdart/fpdart.dart';
import 'package:hng_2_task/core/core.dart';
import 'package:hng_2_task/features/features.dart';

abstract class CountryRepository {
  Future<Either<Failure, List<Country>>> getCountries({
    int? page,
    int? perPage,
  });
}
