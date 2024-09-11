import 'package:flutter/material.dart';

class BmiDetailScreen extends StatelessWidget {
  const BmiDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Details',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          child: Container(
            height: 300,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Underweight: BMI is less than 18.5'),
                Text('Healthy weight: BMI is between 18.5 and 24.9'),
                Text('Overweight: BMI is between 25 and 29.9'),
                Text('Obese: BMI is between 30 and 39.9'),
                Text('Severely obese: BMI is 40 or more')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
