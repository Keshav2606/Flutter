import 'dart:async';
import 'package:bmi_calculator/pages/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    
    super.initState();

    Timer(const Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MyHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Image.asset('assets/images/bmi_calculator_logo.jpg'),
        ),
      ),
    );
  }
}
