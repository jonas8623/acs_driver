import 'package:flutter/material.dart';

import '../../presentation/presentation.dart';

class AppRoutes {

  static const String routeHome = "/home";
  static const String routeRegisterRide = "/registerRace";
  static const String routeRideList = "/rideList";

  Route? getRoutes(RouteSettings settings) {

    switch(settings.name) {

      case routeHome : {
        return MaterialPageRoute<void>(
            settings: settings,
            builder: (BuildContext context) => const HomePage(),
            fullscreenDialog: true
        );
      }

      case routeRegisterRide : {
        return MaterialPageRoute<void>(
            settings: settings,
            builder: (BuildContext context) => const RegisterRidePage(),
            fullscreenDialog: true
        );
      }

      case routeRideList : {
        return MaterialPageRoute<void>(
            builder: (BuildContext context) => const RideListPage(),
            fullscreenDialog: true
        );
      }
    }
  }
}