import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/pages/second_page.dart';
import 'package:provider_practice/providers/list_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
      builder: (context, numbersListModel, child) => Scaffold(
        appBar: AppBar(
          title: Text('Provider Home: ${numbersListModel.numbers.last}'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          actions: [
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SecondPage()));
                },
                child: const Text('Next Page  '))
          ],
        ),
        body: ListView.separated(
            itemCount: numbersListModel.numbers.length,
            separatorBuilder: (context, index) => const Divider(
                  height: 12,
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
