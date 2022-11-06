import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var valuecontroller = TextEditingController();

  List todos = [].obs;
  String input = "";

  void initState() {
    //super.initState();
    todos.add("Task1");
    todos.add("Task2");
    todos.add("Task3");
    todos.add("Task4");
  }

  void add(value) {
    todos.add(value);
  }

  void remove(index) {
    todos.removeAt(index);
  }
}
