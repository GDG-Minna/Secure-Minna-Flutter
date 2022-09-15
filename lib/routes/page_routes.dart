
import 'package:secure_minna/about_page.dart';
import 'package:secure_minna/federal_fire_service_page.dart';
import 'package:secure_minna/federal_road_safety_page.dart';
import 'package:secure_minna/hospital_page.dart';
import 'package:secure_minna/nema_page.dart';
import 'package:secure_minna/nigeria_civil_defence_page.dart';
import 'package:secure_minna/nigeria_police_force_page.dart';
import 'package:secure_minna/privacy_policy_page.dart';
import 'package:secure_minna/security_agencies_page.dart';

class PageRoutes {
  static const String securityAgencies  = SecurityAgenciesPage.routeName;
  static const String about = AboutPage.routeName;
  static const String privacyPolicy = PrivacyPolicyPage.routeName;
  static const String police = NigeriaPoliceForcePage.routeName;
  static const String civilDefence = NigerianCivilDefencePage.routeName;
  static const String roadSafety = FederalRoadSafetyPage.routeName;
  static const String nema = NemaPage.routeName;
  static const String fireService = FederalFireServicePage.routeName;
  static const String hospital = HospitalPage.routeName;
}