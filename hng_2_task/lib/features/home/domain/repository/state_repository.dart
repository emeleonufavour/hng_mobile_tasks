import 'package:fpdart/fpdart.dart';
import 'package:hng_2_task/core/core.dart';
import 'package:hng_2_task/features/features.dart';

abstract class StateRepository {
  Future<Either<Failure, List<StateEntity>>> getStates(String countryId);
}
