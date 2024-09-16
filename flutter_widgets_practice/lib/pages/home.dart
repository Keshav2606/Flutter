import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedValue = "Python";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.green,
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Which is your Favorite Programming Language?',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 21,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 11, horizontal: 30),
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: DropdownButton(
                  value: selectedValue,
                  isExpanded: true,
                  onChanged: (String? newValue) {
                    selectedValue = newValue!;

                    setState(() {});
                  },
                  items: <String>["JavaScript", "Python", "C++", "Java", "C"]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
              ),
            ],
          )),
    );
  }
}
