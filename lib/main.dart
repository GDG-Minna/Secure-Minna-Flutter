import 'dart:async';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:secure_minna/firebase_options.dart';
import 'package:secure_minna/screens/home_screens/home_page.dart';
import 'package:secure_minna/screens/onboarding_screens/splash_screen_page.dart';

import 'package:secure_minna/screens/onboarding_screens/onboarding_page.dart';
import 'package:secure_minna/util/utils.dart';

//int initScreen;
void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    var path = await getApplicationDocumentsDirectory();
    // initialize hive with the app directory
    Hive.init(path.path);
    // open a box "onboarding"
    await Hive.openBox('onboarding');

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    // get path of the app

    runApp(const MainPage());
  }, (error, stack) {
    logDebug('...........GENERAL CRASH START................',
        level: Level.debug);
    logDebug(error.toString(), level: Level.debug);
    logDebug(stack.toString(), level: Level.debug);
    logDebug('...........GENERAL CRASH END................',
        level: Level.debug);
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  });
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
    );
  }
}
