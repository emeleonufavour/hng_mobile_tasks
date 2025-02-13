import 'error.dart';

class BaseFailures extends Failure {
  const BaseFailures({
    required super.message,
    super.trace,
  });
  @override
  String toString() {
    return 'Base Failures: $message $trace';
  }
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message, super.trace});

  @override
  String toString() {
    return 'Server Failure: $message $trace';
  }
}

class SocketFailure extends Failure {
  const SocketFailure({required super.message, super.trace});

  @override
  String toString() {
    return 'Socket Failure: $message $trace';
  }
}
