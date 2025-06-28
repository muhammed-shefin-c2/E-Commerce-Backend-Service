import 'package:commerce_js_mobile_app/Screens/OnBoardingScreen.dart';
import 'package:flutter/material.dart';
import 'package:commerce_js_mobile_app/Screens/Splash_Screen2.dart';

class SplashScreen1 extends StatefulWidget {
  SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  double _opacity = 0.0; // Initial opacity is 0 (fully transparent)

  @override
  void initState() {
    super.initState();

    // Wait for 1 second to start the fade-in effect, then transition
    Future.delayed(Duration(milliseconds: 2), () {
      setState(() {
        _opacity = 1.0; // Fade-in effect
      });
    });

    // Navigate to SplashScreen2 after 5 seconds
    Future.delayed(Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Onboardingscreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedOpacity(
        opacity: _opacity,
        duration: Duration(seconds: 1), // Duration of the fade-in effect
        child: Image.asset(
          'assets/splash/Splash Screen 01 (2).png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}

