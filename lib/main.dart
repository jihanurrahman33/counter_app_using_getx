import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    CounterController counterController = Get.find<CounterController>();
    return GetMaterialApp(
      initialBinding: ControllerBinder(),
      home: Scaffold(
        body: Center(
          child: GetBuilder(
            init: counterController,
            builder: (controller) {
              return Text(controller.count.toString());
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

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CounterController());
  }
}
