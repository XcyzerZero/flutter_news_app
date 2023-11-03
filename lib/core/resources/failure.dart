abstract class Failure {}

class ApiFailure extends Failure {}

class ServerFailure extends Failure {}

class DioFailure extends Failure {
  final String error;

  DioFailure({required this.error});
}
