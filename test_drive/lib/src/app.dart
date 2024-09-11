import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  createState() {
    return AppStateKeeper();
  }
}

class AppStateKeeper extends State<App> {
  final bgColor = Color(0xFFDAE0E2);
  final barColor = Color(0xFF0A79DF);

  int count = 0;

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: bgColor,
          floatingActionButton: FloatingActionButton(
            backgroundColor: barColor,
            onPressed: () {
              setState(() {
                count++;
              });
            },
            child: Icon(
              Icons.add,
              color: bgColor,
            ),
          ),
          appBar: AppBar(
            backgroundColor: barColor,
            title: Text('Keshav Mishra: $count'),
            foregroundColor: bgColor,
          ),
          body: Image.asset('assets/images/flutter.png')),
    );
  }
}
