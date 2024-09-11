import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var arrContainers = [
      Container(
        height: 200,
        color: Colors.redAccent,
      ),
      Container(
        height: 200,
        color: Colors.blueAccent,
      ),
      Container(
        height: 200,
        color: Colors.greenAccent,
      ),
      Container(
        height: 200,
        color: Colors.yellowAccent,
      ),
      Container(
        height: 200,
        color: Colors.orangeAccent,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter ListView',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            child: arrContainers[index],
          );
        },
        itemCount: arrContainers.length,
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 12,
          );
        },
      ),
    );
  }
}
