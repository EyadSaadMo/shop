import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;
  const Failure(
      this.message,
      );

  @override
  List<Object> get props => [message];
}

class OfflineFailure extends Failure {
  OfflineFailure(String message) : super(message);



  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);


  @override
  List<Object> get props => [message];
}

class EmptyCacheFailure extends Failure {
  EmptyCacheFailure(String message) : super(message);


  @override
  List<Object> get props => [message];
}