import 'package:flutter/material.dart';

import 'navigation_drawer.dart';

class PrivacyPolicyPage extends StatelessWidget {

  static const String routeName = '/privacyPolicyPage';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Privacy Policy"),
        ),
        drawer: NavigationDrawer(),
        body: Center(child: Text("This is Privacy Policy page")));
  }
}