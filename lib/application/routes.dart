import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tennis_stat/screens/home/home_screen.dart';

class AppRoutes {
  static const home = '/';

  static Widget buildByRoute(BuildContext context, String route, Object args) {
    switch (route) {
      case AppRoutes.home:
        return const HomeScreen();
    }

    throw Exception('Unknown route: $route');
  }

  static Route<dynamic> createRoute(String route, {RouteSettings settings}) {
    switch (route) {
      default:
        return _createRoute<Object>(route, settings);
    }
  }

  static Route<T> _createRoute<T>(String route, RouteSettings settings) {
    return MaterialPageRoute<T>(
      builder: (ctx) => AppRoutes.buildByRoute(ctx, route, settings.arguments),
      settings: settings,
    );
  }

  static bool untilHome(Route<dynamic> route) {
    return route.settings.name == AppRoutes.home;
  }

  AppRoutes._();
}
