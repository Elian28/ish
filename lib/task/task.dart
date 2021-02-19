import 'package:flutter/material.dart';

class Task {
  String name;

  Task({this.name});
}

class Tasks extends StatefulWidget {
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  List<Task> tasks = [
    Task(name: "red"),
    Task(name: "call"),
    Task(name: "do"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(tasks[index].name),
              trailing: Icon(
                Icons.clear,
                color: Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}
