enum HttpMethod { get, post, put, patch, delete }

class Request {
  String host;
  String path;
  String endPoint;
  HttpMethod method;
  Map<String, String> headers;

  Map<String, Object> get parameters {
    return {};
  }

  Uri get uri {
    return Uri(
      scheme: "https",
      host: host,
      path: "$path$endPoint",
      queryParameters: method == HttpMethod.get ? parameters : {},
    );
  }

  Request(
      {required this.host,
      required this.path,
      required this.endPoint,
      this.method = HttpMethod.get,
      this.headers = const {}});
}
