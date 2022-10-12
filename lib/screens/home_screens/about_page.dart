import 'package:flutter/material.dart';

import '../../components/navigation_drawer.dart';

class AboutPage extends StatelessWidget {
  static const String routeName = '/aboutPage';

  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Secure Minna",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        drawer: const NavigationDrawer(),
        body: const Center(child: Text("This is About page")));
  }
}
