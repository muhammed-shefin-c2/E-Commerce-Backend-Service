import 'package:commerce_js_mobile_app/Screens/SingUp.dart';
import 'package:flutter/material.dart';
import 'package:commerce_js_mobile_app/Screens/Login_Screen.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    _controller = AnimationController(
      duration: Duration(seconds: 2), // Animation duration
      vsync: this,
    );

    // Define the sliding effect
    _offsetAnimation = Tween<Offset>(
      begin: Offset(1.0, 0.0), // Start off-screen at the bottom
      end: Offset.zero,        // End at its normal position
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInBack));

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller to free up resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SlideTransition(
        position: _offsetAnimation, // Apply sliding animation
        child: Stack(
          children: [
            // Background image
            Image.asset(
              'assets/splash/girl2.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
            ),
            // Positioned buttons
            Positioned(
              top: 720, // Adjust the vertical position of the buttons
              left: 30, // Adjust the horizontal position
              right: 30, // Adjust the horizontal position for the second button
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                      print("Login pressed");
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Color(0xFF000000),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                    ),
                  ),
                  SizedBox(height: 20), // Space between buttons
                  ElevatedButton(
                    onPressed: () {
                      print("Sign Up pressed");
                      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SingUpScreen()));
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(width: 1, color: Colors.white),
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

