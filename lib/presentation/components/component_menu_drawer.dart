import 'package:flutter/material.dart';

import '../../core/routes/routes.dart';

class ComponentMenuDrawer extends StatelessWidget {
  const ComponentMenuDrawer({Key? key}) : super(key: key);

  Widget _createHeader(BuildContext context) {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                 Color.fromRGBO(250, 133, 63, 0.9),
                Colors.white,
              ],
            begin: Alignment.centerLeft,
            end: Alignment.bottomRight
          )
        ),
        child: Stack(
          children: const <Widget>[
            Positioned(
                bottom: 12.0,
                left: 16.0,
                child: Text('AAAABBBBCCCC - 00000000',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),)
            ),
            Positioned(
                top: 45.0,
                left: 16.0,
                  child: Icon(Icons.person, size: 100,)
            )
          ],
        )
    );
  }

  Widget _createDrawerItem({
    required IconData icon, required String text, required GestureTapCallback onTap
  }) {
    return ListTile(
      title: Row(
        children: [
          Icon(icon),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _createHeader(context),
          const SizedBox(height: 10.0,),
          _createDrawerItem(
              icon: Icons.home,
              text: 'Home',
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, AppRoutes.routeHome);
              }
          ),
          const Divider(),
          _createDrawerItem(
              icon: Icons.add,
              text: 'Solicitar Corrida',
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, AppRoutes.routeRegisterRide);
              }
          ),
          const Divider(),
          _createDrawerItem(
              icon: Icons.list_alt,
              text: 'Corridas Cadastradas',
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, AppRoutes.routeRideList);
              }
          ),
        ],
      ),
    );
  }
}

