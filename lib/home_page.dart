import 'package:flutter/material.dart';
import 'package:secure_minna/about_page.dart';
import 'package:secure_minna/federal_fire_service_page.dart';
import 'package:secure_minna/federal_road_safety_page.dart';
import 'package:secure_minna/hospital_page.dart';
import 'package:secure_minna/nema_page.dart';
import 'package:secure_minna/nigeria_civil_defence_page.dart';
import 'package:secure_minna/privacy_policy_page.dart';
import 'package:secure_minna/routes/page_routes.dart';
import 'package:secure_minna/security_agencies_page.dart';

import 'nigeria_police_force_page.dart';

class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Secure Minna',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: SecurityAgenciesPage(),
      routes: {
        PageRoutes.securityAgencies: (context) => SecurityAgenciesPage(),
        PageRoutes.about: (context) => AboutPage(),
        PageRoutes.privacyPolicy: (context) => PrivacyPolicyPage(),
        PageRoutes.police: (context) => NigeriaPoliceForcePage(),
        PageRoutes.civilDefence: (context) => NigerianCivilDefencePage(),
        PageRoutes.roadSafety: (context) => FederalRoadSafetyPage(),
        PageRoutes.nema: (context) => NemaPage(),
        PageRoutes.fireService: (context) => FederalFireServicePage(),
        PageRoutes.hospital: (context) => HospitalPage(),

      },
    );
  }
}