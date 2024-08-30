import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:secure_minna/screens/home_screens/home_page.dart';
import 'package:secure_minna/screens/onboarding_screens/splash_screen_page.dart';

import 'package:secure_minna/screens/onboarding_screens/onboarding_page.dart';

//int initScreen;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // get path of the app
  var path = await getApplicationDocumentsDirectory();
  // initialize hive with the app directory
  Hive.init(path.path);
  // open a box "onboarding"
  await Hive.openBox('onboarding');
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main Screen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreenPage(),
        'onboarding': (context) => const OnboardingPage(),
        'home': (context) => const HomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
