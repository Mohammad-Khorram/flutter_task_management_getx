import 'package:dio/dio.dart' as dio;

class NetworkException implements Exception {
  final String message;

  NetworkException({required this.message});

  static NetworkException handleResponse(dio.Response response) =>
      switch (response.statusCode) {
        400 => BadRequestException(),
        401 => UnauthorizedException(),
        403 => ForbiddenException(),
        404 => NotFoundException(),
        405 => MethodNotAllowedException(),
        500 => InternalServerErrorException(),
        _ => UnknownException()
      };

  static ParsingDataException parsingDataException() => ParsingDataException();
}

class ParsingDataException extends NetworkException {
  ParsingDataException()
      : super(message: 'An error occurred while parsing data.');
}

// 400
class BadRequestException extends NetworkException {
  BadRequestException()
      : super(
            message:
                'Your request is invalid. Please review your request and try again.');
}

// 401
/// call refresh_token
class UnauthorizedException extends NetworkException {
  UnauthorizedException()
      : super(message: 'You are not authorized to access this content.');
}

// 403
class ForbiddenException extends NetworkException {
  ForbiddenException()
      : super(message: 'You are not authorized to access this content.');
}

// 404
class NotFoundException extends NetworkException {
  NotFoundException()
      : super(message: 'An error occurred. Please try again later.');
}

// 405
class MethodNotAllowedException extends NetworkException {
  MethodNotAllowedException()
      : super(message: 'An error occurred. Please try again later.');
}

// 500
class InternalServerErrorException extends NetworkException {
  InternalServerErrorException()
      : super(message: 'An unexpected issue occurred. Please try again later.');
}

class UnknownException extends NetworkException {
  UnknownException()
      : super(message: 'An error occurred. Please try again later.');
}
