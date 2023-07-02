import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:network/exception.dart';

import 'request.dart';

class APIRepository {
  static final APIRepository _singleton = APIRepository._internal();
  factory APIRepository() {
    return _singleton;
  }
  APIRepository._internal();

  http.Client client = http.Client();

  Future<T> excute<T>({
    required Request request,
    required T Function(dynamic data) builder,
  }) async {
    try {
      http.Response? response;
      Uri uri = request.uri;
      final body = jsonEncode(request.parameters);
      if (request.method == HttpMethod.get) {
        response = await client.get(uri, headers: request.headers);
      } else if (request.method == HttpMethod.post) {
        response = await client.post(uri,
            headers: request.headers, body: body, encoding: utf8);
      } else if (request.method == HttpMethod.put) {
        response = await client.put(uri,
            headers: request.headers, body: body, encoding: utf8);
      } else if (request.method == HttpMethod.patch) {
        response = await client.patch(uri,
            headers: request.headers, body: body, encoding: utf8);
      } else if (request.method == HttpMethod.delete) {
        response = await client.delete(uri,
            headers: request.headers, body: body, encoding: utf8);
      }
      if (response == null) {
        throw InvalidRequestException();
      }
      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return builder(data);
        case 401:
          throw UnauthorizedException();
        case 404:
          throw NotFoundException();
        default:
          throw UnknownException();
      }
    } on SocketException catch (_) {
      throw NoInternetConnectionException();
    }
  }
}
