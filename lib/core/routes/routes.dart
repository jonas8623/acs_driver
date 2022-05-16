import 'package:flutter/material.dart';
import 'package:uber_ambev_test/presentation/pages/pages.dart';

class AppRoutes {

  static const String routeHome = "/home";
  static const String routeRequestRaces = "/registerRace";
  static const String routeConfirmedRaces = "/confirmedRaces";

  Route? getRoutes(RouteSettings settings) {

    switch(settings.name) {

      case routeHome : {
        return MaterialPageRoute<void>(
            settings: settings,
            builder: (BuildContext context) => const HomePage(),
            fullscreenDialog: true
        );
      }

      case routeRequestRaces : {
        return MaterialPageRoute<void>(
            settings: settings,
            builder: (BuildContext context) => const RequestRacePage(),
            fullscreenDialog: true
        );
      }

      case routeConfirmedRaces : {
        return MaterialPageRoute<void>(
            builder: (BuildContext context) => const ConfirmedRacesPage(),
            fullscreenDialog: true
        );
      }
    }
  }
}