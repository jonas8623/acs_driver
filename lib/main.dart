import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:uber_ambev_test/presentation/blocs/blocs.dart';
import 'package:uber_ambev_test/presentation/pages/pages.dart';
import 'package:get_it/get_it.dart';

import 'core/routes/route_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RaceBloc>(
      create: (context) => RaceBloc(),
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('pt', 'BR')],
        debugShowCheckedModeBanner: false,
        title: 'ACS DRIVER',
        onGenerateRoute: RouteConfig().getRoutesConfig().getRoutes,
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(250, 133, 63, 0.9),
        ),
        home: const HomePage(),
      ),
    );
  }
}
