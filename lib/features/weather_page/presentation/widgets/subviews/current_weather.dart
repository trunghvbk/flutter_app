import 'package:flutter/material.dart';
import 'package:flutter_app/features/weather_page/domain/weather/weather_data.dart';
import 'package:flutter_app/features/weather_page/presentation/controllers/current_weather_controller.dart';
import 'package:flutter_app/features/weather_page/presentation/widgets/subviews/weather_icon_image.dart';
import 'package:flutter_app/features/weather_page/presentation/widgets/weather_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentWeather extends ConsumerWidget {
  const CurrentWeather({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherDataValue = ref.watch(currentWeatherControllerProvider);
    final city = ref.watch(cityProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(city, style: Theme.of(context).textTheme.headlineMedium),
        weatherDataValue.when(
          data: (weatherData) => CurrentWeatherContents(data: weatherData),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, __) => Text(e.toString()),
        ),
      ],
    );
  }
}

class CurrentWeatherContents extends ConsumerWidget {
  const CurrentWeatherContents({Key? key, required this.data})
      : super(key: key);
  final WeatherData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    final temp = data.temp.celsius.toInt().toString();
    final minTemp = data.minTemp.celsius.toInt().toString();
    final maxTemp = data.maxTemp.celsius.toInt().toString();
    final highAndLow = 'H:$maxTemp° L:$minTemp°';
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        WeatherIconImage(iconUrl: data.iconUrl, size: 120),
        Text(temp, style: textTheme.headline2),
        Text(highAndLow, style: textTheme.bodyText2),
      ],
    );
  }
}
