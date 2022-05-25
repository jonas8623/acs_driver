import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:uber_ambev_test/presentation/components/components.dart';
import '../../app/routes/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget _screens(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ComponentHomeButton(icon: Icons.add_circle, text: 'Solicitar Corrida', onTap: () {
                Navigator.pushNamed(context, AppRoutes.routeRegisterRide);
              }),
              ComponentHomeButton(icon: Icons.list_alt_outlined, text: 'Corridas Cadastradas', onTap: () {
                Navigator.pushNamed(context, AppRoutes.routeRideList);
              }),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ComponentHomeButton(icon: Icons.person_add_alt_1_outlined, text: 'Join', onTap: () {
                Navigator.pushNamed(context, AppRoutes.routeRideList);
              }),
              ComponentHomeButton(icon: Icons.list_alt_outlined, text: 'Sobre', onTap: () {
                log('Apertou no botão');
              }),
            ],
          ),
        )
      ],
    );
  }

  Widget _image() => Image.asset('assets/images/viagem.png', fit: BoxFit.cover);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('ACS DRIVER', style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: const ComponentMenuDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: ListView(
          children: [
            const SizedBox(height: 15.0,),
            _image(),
            const SizedBox(height: 30.0,),
            _screens(context),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
