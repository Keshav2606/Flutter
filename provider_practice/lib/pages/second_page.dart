import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/providers/list_provider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
      builder: (context, numbersListModel, child) => Scaffold(
        appBar: AppBar(
          title: Text('Provider Second: ${numbersListModel.numbers.last}'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: numbersListModel.numbers.length,
            separatorBuilder: (context, index) => const SizedBox(
                  width: 12,
                ),
            itemBuilder: (context, index) {
              return Text(
                numbersListModel.numbers[index].toString(),
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            numbersListModel.add();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
