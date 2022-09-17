
import 'package:secure_minna/screens/home_screens/about_page.dart';
import 'package:secure_minna/screens/federal_fire_service_screens/federal_fire_service_page.dart';
import 'package:secure_minna/screens/federal_road_safety_screens/federal_road_safety_page.dart';
import 'package:secure_minna/screens/hospital_screens/hospital_page.dart';
import 'package:secure_minna/screens/nema_screens/nema_page.dart';
import 'package:secure_minna/screens/nigeria_civil_defence_screens/nigeria_civil_defence_page.dart';
import 'package:secure_minna/screens/nigeria_police_force_screens/nigeria_police_force_page.dart';
import 'package:secure_minna/screens/home_screens/privacy_policy_page.dart';
import 'package:secure_minna/screens/home_screens/security_agencies_page.dart';

class PageRoutes {
  static const String securityAgencies  = SecurityAgenciesPage.routeName;
  static const String about = AboutPage.routeName;
  static const String privacyPolicy = PrivacyPolicyPage.routeName;
  static const String police = NigeriaPoliceForcePage.routeName;
  static const String civilDefence = NigeriaCivilDefencePage.routeName;
  static const String roadSafety = FederalRoadSafetyPage.routeName;
  static const String nema = NemaPage.routeName;
  static const String fireService = FederalFireServicePage.routeName;
  static const String hospital = HospitalPage.routeName;
}