import 'dart:async';

import 'package:flutter/material.dart';
import 'package:juw/Views/authentication/Login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Simulate a delay using Timer
    Timer(Duration(seconds: 3), () {
      // Navigate to the main screen after the splash screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginFormWidget()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Add your splash screen content, such as a logo
              Image.asset('lib/images/logos/new logo.png', width: 250, height: 250),
              SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}
