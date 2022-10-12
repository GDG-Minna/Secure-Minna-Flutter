import 'package:flutter/material.dart';
import '../../components/navigation_drawer.dart';

class PrivacyPolicyPage extends StatelessWidget {
  static const String routeName = '/privacyPolicyPage';

  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Privacy Policy",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppins',
              )),
        ),
        drawer: const NavigationDrawer(),
        body: const Center(child: Text("This is Privacy Policy page")));
  }
}
