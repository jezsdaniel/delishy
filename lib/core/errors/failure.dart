import 'package:equatable/equatable.dart';

enum FailureType {
  network,
  server,
  unknown,
}

class Failure extends Equatable {
  @override
  List<Object> get props => [];

  String get message => '';

  String? get customStatusCode => '';

  FailureType get type => FailureType.unknown;
}

class NetworkFailure extends Failure {
  @override
  String get message => 'Network error';

  @override
  FailureType get type => FailureType.network;
}

class ServerFailure extends Failure {
  @override
  String get message => 'Server error';

  @override
  FailureType get type => FailureType.server;
}