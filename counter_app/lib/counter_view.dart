import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            counter.toString(),
            style: const TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton.small(
                onPressed: () {
                  setState(() {
                    counter--;
                  });
                },
                elevation: 0,
                backgroundColor: Colors.black,
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              FloatingActionButton.small(
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
                elevation: 0,
                backgroundColor: Colors.black,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
