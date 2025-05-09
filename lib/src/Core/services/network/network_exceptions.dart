import 'package:flutter/cupertino.dart';

class NetworkException implements Exception {
  NetworkException([this._message, this._prefix]) {
    debugPrint("_message $_message");
  }

  final dynamic _message;
  final dynamic _prefix;

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends NetworkException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends NetworkException {
  BadRequestException([String? message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends NetworkException {
  UnauthorisedException([String? message]) : super(message, "Unauthorised: ");
}

class ForbiddenException extends NetworkException {
  ForbiddenException([String? message]) : super(message, "Forbidde: ");
}

class InvalidInputException extends NetworkException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class ServerSideException extends NetworkException {
  ServerSideException([String? message]) : super(message, "Server side: ");
}

class UnAuthorizedException extends NetworkException {
  UnAuthorizedException([String? message]) : super(message, "Server side: ");
}

class UnKnownException extends NetworkException {
  UnKnownException([String? message]) : super(message, "Server side: ");
}

class NetworkDisconnectException extends NetworkException {
  NetworkDisconnectException([String? message])
      : super(message, "Server side: ");
}
