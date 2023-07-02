import 'package:flutter/widgets.dart';
import 'package:flutter_app/features/auth/presentation/auth_page.dart';
import 'package:flutter_app/features/home_page/presentation/widgets/home_page.dart';
import 'package:flutter_app/features/main_page/presentation/widgets/main_page.dart';
import 'package:flutter_app/features/products/presentation/product_list_page.dart';
import 'package:flutter_app/features/weather_page/presentation/widgets/weather_page.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

// GoRouter configuration
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/weather',
  routes: [
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => MainPage(child: child),
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: '/product_list',
            builder: (context, state) => const ProductListPage(),
          ),
          GoRoute(
            path: '/weather',
            builder: (context, state) => const WeatherPage(),
          ),
          GoRoute(
            path: '/account',
            builder: (context, state) => const AuthPage(),
          )
        ]),
  ],
);
