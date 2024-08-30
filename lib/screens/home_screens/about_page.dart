import 'package:flutter/material.dart';

import 'package:secure_minna/components/navigation_drawers.dart';

class AboutPage extends StatelessWidget {
  static const String routeName = '/aboutPage';

  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Secure Minna',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        drawer: const NavigationDrawers(),
        body: const Center(child: Text('This is About page')));
  }
}
