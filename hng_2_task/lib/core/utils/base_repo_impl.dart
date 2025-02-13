import 'dart:async';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:hng_2_task/core/core.dart';

mixin RepositoryErrorHandler {
  FutureOr<Either<Failure, T>> callAction<T>(
    Future<T> Function() action,
  ) async {
    try {
      final result = await action();
      return Right(result);
    } on SocketException {
      return const Left(SocketFailure(message: ErrorText.noInternet));
    } on TimeoutException {
      return const Left(BaseFailures(message: ErrorText.timeOutError));
    } catch (e, s) {
      AppLogger.log('$e $s', tag: 'CATCH CALL ACTION');
      if (e is BaseFailures) {
        return Left(BaseFailures(message: e.message));
      }
      return Left(BaseFailures(message: e.toString()));
    }
  }
}
