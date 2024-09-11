import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var htController = TextEditingController();
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Image.asset('assets/images/bmi_calculator_logo.jpg'),
          title: const Text(
            'BMI Calculator',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Container(
            width: 500,
            height: 500,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 11, horizontal: 21),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(21)),
                border: Border.all(width: 1),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(blurRadius: 5, spreadRadius: 0, offset: Offset.zero)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'BMI',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 21,
                ),
                TextField(
                  controller: wtController,
                  decoration: const InputDecoration(
                      label: Text('Enter your weight(in Kgs)'),
                      prefixIcon: Icon(Icons.line_weight)),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: htController,
                  decoration: const InputDecoration(
                      label: Text('Enter your height(in meters)'),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 21,
                ),
                ElevatedButton(
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var ht = htController.text.toString();

                      if (ht != "" && wt != "") {
                        int iWt = int.parse(wt);
                        double iHt = double.parse(ht);

                        int bmi = (iWt / (iHt * iHt)).floor();

                        setState(() {
                          result = 'BMI: $bmi';
                        });
                      } else {
                        setState(() {
                          result = "Please fill all the required details.";
                        });
                      }
                    },
                    child: const Text(
                      'Calculate',
                      style: TextStyle(color: Colors.black),
                    )),
                const SizedBox(
                  height: 11,
                ),
                Text(
                  result,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 21,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('1. Underweight: BMI is less than 18.5'),
                    Text('2. Healthy: BMI is between 18.5 and 24.9'),
                    Text('3. Overweight: BMI is between 25 and 29.9'),
                    Text('4. Obese: BMI is between 30 and 39.9'),
                    Text('5. Severely obese: BMI is 40 or more')
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
