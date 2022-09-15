import 'package:flutter/material.dart';

import 'navigation_drawer.dart';

class SecurityAgenciesPage extends StatelessWidget {

  static const String routeName = '/securityAgenciesPage';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Secure Minna"),
        ),
        drawer: NavigationDrawer(),
        body: Center(child: Text("This is Security Agencies page")));
  }
}