import 'package:flutter/material.dart';
import 'package:uber_ambev_test/core/routes/routes.dart';


class RouteConfig extends StatelessWidget{

  static const RouteConfig _instance = RouteConfig._internal();
  const RouteConfig._internal();

  factory RouteConfig() => _instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: getRoutesConfig().getRoutes,
    );
  }

  AppRoutes getRoutesConfig() {
    return AppRoutes();
  }
}