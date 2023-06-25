import 'package:flutter_app/features/weather_page/data/repository/weather_repository.dart';
import 'package:flutter_app/features/weather_page/domain/weather/weather_data.dart';
import 'package:flutter_app/features/weather_page/presentation/widgets/weather_page.dart';
import 'package:flutter_app/providers/repository_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentWeatherController extends StateNotifier<AsyncValue<WeatherData>> {
  CurrentWeatherController(this._weatherRepository, {required this.city})
      : super(const AsyncValue.loading()) {
    getWeather(city: city);
  }
  final HttpWeatherRepository _weatherRepository;
  final String city;

  Future<void> getWeather({required String city}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final weather = await _weatherRepository.getWeather(city: city);
      return WeatherData.from(weather);
    });
  }
}

final currentWeatherControllerProvider = StateNotifierProvider.autoDispose<
    CurrentWeatherController, AsyncValue<WeatherData>>((ref) {
  final weatherRepository = ref.watch(weatherRepositoryProvider);
  final city = ref.watch(cityProvider);
  return CurrentWeatherController(weatherRepository, city: city);
});
