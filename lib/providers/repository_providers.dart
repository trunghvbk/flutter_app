import 'package:flutter_app/features/auth/data/repository/auth_repository.dart';
import 'package:flutter_app/features/cart/data/repository/local_cart_repository.dart';
import 'package:flutter_app/features/cart/data/repository/remote_cart_repository.dart';
import 'package:flutter_app/features/weather_page/data/api/api.dart';
import 'package:flutter_app/features/weather_page/data/repository/weather_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../features/weather_page/data/api/api_keys.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  // This should be overridden in main file
  throw UnimplementedError();
});

final localCartRepositoryProvider = Provider<LocalCartRepository>((ref) {
  // This should be overridden in main file
  throw UnimplementedError();
});

final remoteCartRepositoryProvider = Provider<RemoteCartRepository>((ref) {
  // This should be overridden in main file
  throw UnimplementedError();
});

/// Providers used by rest of the app
final weatherRepositoryProvider = Provider<HttpWeatherRepository>((ref) {
  /// Use the API key passed via --dart-define,
  /// or fallback to the one defined in api_keys.dart
  // set key to const
  const apiKey = String.fromEnvironment(
    APIKeys.openWeatherAPIKey,
    defaultValue: APIKeys.openWeatherAPIKey,
  );
  return HttpWeatherRepository(
    api: OpenWeatherMapAPI(apiKey),
    client: http.Client(),
  );
});
