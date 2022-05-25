import 'package:flutter/material.dart';

import 'app_routes.dart';


class AppConfig extends StatelessWidget{

  static const AppConfig _instance = AppConfig._internal();
  const AppConfig._internal();

  factory AppConfig() => _instance;

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