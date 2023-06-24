import 'package:flutter/material.dart';
import 'package:flutter_app/features/auth/presentation/auth_page.dart';
import 'package:flutter_app/features/weather_page/presentation/widgets/weather_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyleWithShadow = TextStyle(color: Colors.white, shadows: [
      BoxShadow(
        color: Colors.black12.withOpacity(0.25),
        spreadRadius: 1,
        blurRadius: 4,
        offset: const Offset(0, 0.5),
      )
    ]);
    return MaterialApp(
      title: 'Flutter Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        textTheme: TextTheme(
          headline1: textStyleWithShadow,
          headline2: textStyleWithShadow,
          headline3: textStyleWithShadow,
          headline4: textStyleWithShadow,
          headline5: textStyleWithShadow,
          subtitle1: const TextStyle(color: Colors.white),
          bodyText2: const TextStyle(color: Colors.white),
          bodyText1: const TextStyle(color: Colors.white),
          caption: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
      ),
      // home: const WeatherPage(city: 'London'),
      home: const AuthPage(),
    );
  }
}
