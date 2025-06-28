import 'package:commerce_js_mobile_app/Screens/OnBoarding/OnBoarding1.dart';
import 'package:commerce_js_mobile_app/Screens/OnBoarding/OnBoarding2.dart';
import 'package:commerce_js_mobile_app/Screens/OnBoarding/OnBoarding3.dart';
import 'package:commerce_js_mobile_app/Screens/SingUp.dart';
import 'package:commerce_js_mobile_app/Screens/Splash_Screen2.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  PageController pageController = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index){
              setState(() {
                onLastPage = (index == 2);
              });
            },
          children: [
            Onboarding1(),
          Onboarding2(),
          Onboarding3()
          ],
        ),
          Container(
            alignment: Alignment(1, 0.91),
              child: Padding(
                padding: const EdgeInsets.only(right: 25, left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        activeDotColor: Colors.black,
                        dotHeight: 9,
                        expansionFactor: 3.5,
                        dotWidth: 9,
                        spacing: 9
                      ),
                    ),
                    onLastPage
                        ? ElevatedButton(onPressed: (){
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => SplashScreen2()));
                    },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          minimumSize: Size(100, 50)
                        ),
                        child: Text('DONE', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),))
                        : ElevatedButton(onPressed: (){
                      pageController.nextPage(duration: Duration(milliseconds: 600), curve: Curves.easeIn);},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          minimumSize: Size(100, 50)
                        ),
                        child: Text('NEXT', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),)),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}