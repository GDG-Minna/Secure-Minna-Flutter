
import 'package:flutter/material.dart';

import 'navigation_drawer.dart';

class AboutPage extends StatelessWidget {

  static const String routeName = '/aboutPage';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Secure Minna"),
        ),
        drawer: NavigationDrawer(),
        body: Center(child: Text("This is About page")));
  }
}