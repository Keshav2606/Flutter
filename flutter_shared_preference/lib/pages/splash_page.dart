import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_shared_preference/pages/home_page.dart';
import 'package:flutter_shared_preference/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  dynamic isUserLoggedin = false;
  @override
  void initState() {
    super.initState();

    getUserLoggedinStatus();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        if (isUserLoggedin) {
          return const HomePage();
        }
        return const LoginPage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/images/flutter_logo.png')),
    );
  }

  void getUserLoggedinStatus() async {
    var pref = await SharedPreferences.getInstance();

    isUserLoggedin = pref.getBool('isUserLoggedin');
  }
}
