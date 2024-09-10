import 'dart:async';

import 'package:flutter/material.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0; // Initial opacity for the animation

  @override
  void initState() {
    super.initState();

    // Start the opacity animation
    Timer(Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0; // Animate to fully visible
      });
    });

    // Navigate to Home Page after 4 seconds
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff387F39),
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(seconds: 2), // Duration of the fade-in effect
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.white,
                width: 3, // Adjust the border width
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Summary_App",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
