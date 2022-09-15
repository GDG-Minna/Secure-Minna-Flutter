
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:secure_minna/home_page.dart';

class OnboardingPage extends StatefulWidget {

  const OnboardingPage({Key? key}) : super(key: key);


  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
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
          body: 'Call or send SMS to report suspicious or fraudulent activities around your environ without stress.',
          image: buildImage('assets/images/onboarding1.png'),
          decoration: buildDecoration(),
        ),
        PageViewModel(
          title: 'Call for help from Emergency Centres',
          body: 'Call emergency centres for first aid response or disaster recovery agencies for quick action and backup.',
          image: buildImage('assets/images/onboarding2.png'),
          decoration: buildDecoration(),
        ),
        PageViewModel(
          title: 'Locate Emergency Centres using Map',
          body: 'Navigate easily to the nearest emergency centre to report a case or admit victims/detain Suspects.',
          image: buildImage('assets/images/onboarding3.png'),
          decoration: buildDecoration(),
        ),
      ],
      next: const Icon(Icons.navigate_next, size: 40, color: Color(0xFF55A3DA),),
      done: const Text('Start', style: TextStyle(color: Color(0xFF55A3DA), fontSize: 20, fontFamily: 'Poppins')),
      onDone: () => {
        box.put('status', 'true'),
        goToHome(context)
      },
      showSkipButton: true,
      skip: const Text('Skip', style: TextStyle(color: Color(0xFF55A3DA), fontFamily: 'Poppins' ,fontSize: 20),), //by default, skip goes to the last page
      onSkip: () => {
        box.put('status', 'true'),
        goToHome(context)
      },
      dotsDecorator: getDotDecoration(),
      animationDuration: 1000,
      globalBackgroundColor: Colors.white,
    );
  }

  DotsDecorator getDotDecoration() => DotsDecorator(
      color: const Color(0xFFCBE0EF),
      size: const Size(10,10),
      activeColor: const Color(0xFF55A3DA),
      activeSize: const Size(40,10),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      )

  );

  void goToHome(BuildContext context) => Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomePage()));

  Widget buildImage(String path) => Center(
      child: Image.asset(path)
  );

  PageDecoration buildDecoration() => const PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF474747), fontFamily: 'Poppins'),
    bodyTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Color(0xFF474747), fontFamily: 'Poppins'),
    pageColor: Colors.white,
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