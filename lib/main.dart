import 'package:counter/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBinder(),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<CounterController>(
                builder: (controller) {
                  return Text(controller.count.toString());
                },
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => ProfileScreen());
                },
                child: Text('Go to profile'),
              ),
            ],
          ),
        ),
        floatingActionButton: GetBuilder<CounterController>(
          builder: (controller) {
            return FloatingActionButton(
              onPressed: controller.increment,
              child: Icon(Icons.add),
            );
          },
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

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CounterController());
  }
}
