import 'package:flutter/material.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: ClipPath(
                clipper: DiagonalClipper(),
                child: Container(
                  width: double.infinity,
                  height: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Image.asset(
                    'assets/images/OnBoarding/hls-44-rkBktp5Cg_U-unsplash.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '20% Discount',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'New Arrival Product',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 34),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Publish up your selfie to make yourself\nmore Beautiful with this app',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Clipper for Diagonal Cut
class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 30.0; // Adjust this for the corner roundness

    Path path = Path();

    // Start at the top-left with a curve
    path.moveTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);

    // Top-right corner
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);

    // Diagonal edge with rounded corner
    path.lineTo(size.width, size.height - radius - 50);
    path.quadraticBezierTo(
      size.width, size.height - 50, size.width - radius, size.height - 50);

    // Bottom-left diagonal with rounded corner
    path.lineTo(radius, size.height - 20);
    path.quadraticBezierTo(0, size.height -100, 0, size.height - radius - 100);
    path.lineTo(radius, size.height -20);
    path.quadraticBezierTo(0, size.height -20, 0, size.height -radius -20);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


