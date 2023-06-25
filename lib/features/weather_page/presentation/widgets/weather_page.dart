import 'package:flutter/material.dart';
import 'package:flutter_app/constants/app_colors.dart';
import 'package:flutter_app/features/weather_page/presentation/widgets/subviews/city_search_box.dart';
import 'package:flutter_app/features/weather_page/presentation/widgets/subviews/current_weather.dart';
import 'package:flutter_app/features/weather_page/presentation/widgets/subviews/hourly_weather.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cityProvider = StateProvider((ref) => 'Hanoi');

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.rainGradient,
          ),
        ),
        child: const SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(),
              CitySearchBox(),
              Spacer(),
              CurrentWeather(),
              Spacer(),
              HourlyWeather(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
