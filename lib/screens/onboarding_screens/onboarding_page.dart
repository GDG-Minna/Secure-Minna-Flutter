import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:secure_minna/components/secure_minna_colors.dart';
import 'package:secure_minna/screens/home_screens/home_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnboardingPage> {
  // This is where the box is being made
  var box = Hive.box('onboarding');

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Report Suspicious activities',
          body:
              'Call or send SMS to report suspicious or fraudulent activities around your environ without stress.',
          image: buildImage('assets/images/onboarding1.png'),
          decoration: buildDecoration(),
        ),
        PageViewModel(
          title: 'Call for help from Emergency Centres',
          body:
              'Call emergency centres for first aid response or disaster recovery agencies for quick action and backup.',
          image: buildImage('assets/images/onboarding2.png'),
          decoration: buildDecoration(),
        ),
        PageViewModel(
          title: 'Locate Emergency Centres using Map',
          body:
              'Navigate easily to the nearest emergency centre to report a case or admit victims/detain Suspects.',
          image: buildImage('assets/images/onboarding3.png'),
          decoration: buildDecoration(),
        ),
      ],
      next: const Icon(
        Icons.navigate_next,
        size: 40,
        color: SecureMinnaColors.primary,
      ),
      done: const Text('Start',
          style: TextStyle(
              color: SecureMinnaColors.primary,
              fontSize: 20,
              fontFamily: 'Poppins')),
      onDone: () => {box.put('status', 'true'), goToHome(context)},
      showSkipButton: true,
      skip: const Text(
        'Skip',
        style: TextStyle(
            color: SecureMinnaColors.primary,
            fontFamily: 'Poppins',
            fontSize: 20),
      ), //by default, skip goes to the last page
      onSkip: () => {box.put('status', 'true'), goToHome(context)},
      dotsDecorator: getDotDecoration(),
      animationDuration: 1000,
      globalBackgroundColor: SecureMinnaColors.white,
    );
  }

  DotsDecorator getDotDecoration() => DotsDecorator(
      color: SecureMinnaColors.lightBlue,
      size: const Size(10, 10),
      activeColor: SecureMinnaColors.primary,
      activeSize: const Size(40, 10),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ));

  void goToHome(BuildContext context) => Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (_) => const HomePage()));

  Widget buildImage(String path) => Center(child: Image.asset(path));

  PageDecoration buildDecoration() => const PageDecoration(
        titleTextStyle: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: SecureMinnaColors.lightBlack,
            fontFamily: 'Poppins'),
        bodyTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: SecureMinnaColors.lightBlack,
            fontFamily: 'Poppins'),
        pageColor: SecureMinnaColors.white,
        imagePadding: EdgeInsets.all(0),
      );
}
/*const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("GeeksForGeeks")),
      body: const Center(
          child:Text("Home page",textScaleFactor: 2,)
      ),
    );
  }*/
