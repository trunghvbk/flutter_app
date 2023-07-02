sealed class APIException implements Exception {
  APIException(this.message);
  final String message;
}

class NoInternetConnectionException extends APIException {
  NoInternetConnectionException() : super('No Internet connection');
}

class InvalidRequestException extends APIException {
  InvalidRequestException() : super('The request is not valid');
}

class UnauthorizedException extends APIException {
  UnauthorizedException() : super('Unauthorized');
}

class NotFoundException extends APIException {
  NotFoundException() : super('Not found 404');
}

class UnknownException extends APIException {
  UnknownException() : super('Some error occurred');
}
