import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:secure_minna/components/secure_minna_colors.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  // opening the onboarding box again
  void open() async {
    await Hive.openBox('onboarding');
  }

  // stating the box am referring to which is on-boarding
  var box = Hive.box('onboarding');

  @override
  void initState() {
    Timer(const Duration(seconds: 2),
        box.get('status') == 'true' ? routeHome : routeOnboarding);
    super.initState();
  }

  // Function to Navigate to the on-boarding screen
  routeOnboarding() {
    Navigator.pushReplacementNamed(context, 'onboarding');
  }

  // Function to Navigate to the main screen
  routeHome() {
    Navigator.pushReplacementNamed(context, 'home');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            fit: BoxFit.fitWidth,
            image: AssetImage('assets/images/secure_minna_logo.png'),
          ),
          SizedBox(height: 25),
          Text(
            'Secure Minna',
            style: TextStyle(
              color: SecureMinnaColors.primary,
              fontSize: 40,
              fontWeight: FontWeight.normal,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      )),
    );
  }
}
