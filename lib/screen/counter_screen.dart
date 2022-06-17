import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  void increment() {
    counter++;
    setState(() {});
  }

  void decrement() {
    counter--;
    setState(() {});
  }

  void reset() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(title: const Text('CounterScreen'), elevation: 10),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Contador',
                style: fontSize30,
              ),
              Text('$counter', style: fontSize30)
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomfloatingButtom(
          incrementFn: increment, decrementFn: decrement, resetFn: reset),
    );
  }
}

class CustomfloatingButtom extends StatelessWidget {
  final Function incrementFn;
  final Function decrementFn;
  final Function resetFn;

  const CustomfloatingButtom(
      {Key? key,
      required this.incrementFn,
      required this.decrementFn,
      required this.resetFn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          child: const Icon(
            Icons.add,
          ),
          onPressed: () => incrementFn(),
        ),
        FloatingActionButton(
          child: const Icon(
            Icons.restore,
          ),
          onPressed: () => resetFn(),
        ),
        FloatingActionButton(
          child: const Icon(
            Icons.exposure_minus_1_outlined,
          ),
          onPressed: () => decrementFn(),
        ),
      ],
    );
  }
}
