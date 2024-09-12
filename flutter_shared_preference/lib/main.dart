import 'package:flutter/material.dart';
// import 'package:flutter_shared_preference/pages/home_page.dart';
import 'package:flutter_shared_preference/pages/splash_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true),
      home: const SplashPage(),
    );
  }
}
