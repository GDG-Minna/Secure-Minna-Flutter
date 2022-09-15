import 'package:flutter/material.dart';
import 'package:secure_minna/about_page.dart';
import 'package:secure_minna/privacy_policy_page.dart';
import 'package:secure_minna/routes/page_routes.dart';
import 'package:secure_minna/security_agencies_page.dart';

class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Secure Minna',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SecurityAgenciesPage(),
      routes: {
        PageRoutes.securityAgencies: (context) => SecurityAgenciesPage(),
        PageRoutes.about: (context) => AboutPage(),
        PageRoutes.privacyPolicy: (context) => PrivacyPolicyPage(),
      },
    );
  }
}