import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SplashScreenPage extends StatefulWidget {

  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  // opening the onboarding box again
  void open()async{
    await Hive.openBox('onboarding');
  }

  // stating the box am referring to which is on-boarding
  var box = Hive.box('onboarding');

  @override
  void initState() {
    Timer(const Duration(seconds: 2), box.get('status') == 'true' ? elseroute : route);
    super.initState();
  }

  // Function to Navigate to the on-boarding screen
  route() {
    Navigator.pushReplacementNamed(context, 'onboarding');
  }

  // Function to Navigate to the main screen
  elseroute() {
    Navigator.pushReplacementNamed(context, 'home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Image(
              fit: BoxFit.fitWidth,
              image: AssetImage("assets/images/secure_minna_logo.png"),
            ),
            SizedBox(height: 25),
            Text(
              'Secure Minna',
              style: TextStyle(
                  color: Color(0xFF55A3DA), fontSize: 40, fontWeight: FontWeight.normal,  fontFamily: 'Poppins',),
            ),
          ],
        )
      ),
    );
  }
}
