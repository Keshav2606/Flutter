import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        backgroundColor: Colors.green,
      ),

      body: const Center(
        child: Text('Profile Page', style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),),
      ),
    );
  }
}