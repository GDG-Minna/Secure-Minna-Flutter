import 'package:flutter/material.dart';
import 'package:secure_minna/screens/home_screens/about_page.dart';
import 'package:secure_minna/screens/federal_fire_service_screens/federal_fire_service_page.dart';
import 'package:secure_minna/screens/federal_road_safety_screens/federal_road_safety_page.dart';
import 'package:secure_minna/screens/hospital_screens/hospital_page.dart';
import 'package:secure_minna/screens/nema_screens/nema_page.dart';
import 'package:secure_minna/screens/nigeria_civil_defence_screens/nigeria_civil_defence_page.dart';
import 'package:secure_minna/screens/home_screens/privacy_policy_page.dart';
import 'package:secure_minna/routes/page_routes.dart';
import 'package:secure_minna/screens/home_screens/security_agencies_page.dart';

import 'package:secure_minna/screens/nigeria_police_force_screens/nigeria_police_force_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secure Minna',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: const SecurityAgenciesPage(),
      routes: {
        PageRoutes.securityAgencies: (context) => const SecurityAgenciesPage(),
        PageRoutes.about: (context) => const AboutPage(),
        PageRoutes.privacyPolicy: (context) => const PrivacyPolicyPage(),
        PageRoutes.police: (context) => const NigeriaPoliceForcePage(),
        PageRoutes.civilDefence: (context) => const NigeriaCivilDefencePage(),
        PageRoutes.roadSafety: (context) => const FederalRoadSafetyPage(),
        PageRoutes.nema: (context) => const NemaPage(),
        PageRoutes.fireService: (context) => const FederalFireServicePage(),
        PageRoutes.hospital: (context) => const HospitalPage(),
      },
    );
  }
}
