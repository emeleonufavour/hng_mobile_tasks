import 'package:fpdart/fpdart.dart';
import 'package:hng_2_task/core/core.dart';
import 'package:hng_2_task/features/features.dart';

class StateRepoImpl extends StateRepository with RepositoryErrorHandler {
  final StateRemoteDatasource stateRemoteDatasource;

  StateRepoImpl({required this.stateRemoteDatasource});
  @override
  Future<Either<Failure, List<StateEntity>>> getStates(String countryId) async {
    return callAction(() => stateRemoteDatasource.getStates(countryId));
  }
}
