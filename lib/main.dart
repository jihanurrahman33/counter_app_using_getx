import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    CounterController counterController = CounterController();
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: GetBuilder(
            init: counterController,
            builder: (context) {
              return Text(counterController.count.toString());
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: counterController.increment,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class CounterController extends GetxController {
  int count = 0;
  void increment() {
    count++;
    update();
  }
}
