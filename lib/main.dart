import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'controller/addTask.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.cyan,
          accentColor: Colors.blue),
      home: MyApp(),
    ));

//class MyApp extends StatefulWidget
class MyApp extends StatefulWidget {
  // const ({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //List<int> foo = [];
  var c = Get.put(CounterController());

  get body => null;

  List todos = [];
  String input = "";

// };
  @override
  void initState() {
    super.initState();
    todos.add("Task1");
    todos.add("Task2");
    todos.add("Task3");
    todos.add("Task4");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My todo list"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: c.valuecontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a task',
              ),
              onFieldSubmitted: ((value) {
                c.add(value);
              }),
            ),
          ),
          Obx(() => SizedBox(
                height: MediaQuery.of(context).size.height / 2.5,
                child: ListView.builder(
                    itemCount: c.todos.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(10),
                        child: ListTile(
                          title: Text('${c.todos[index]}'),
                          leading: Icon(Icons.check_box_outline_blank),
                          trailing: IconButton(
                            onPressed: () {
                              c.remove(index);
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ),
                      );
                    }),
              ))
        ],
      ),
    );
  }
}