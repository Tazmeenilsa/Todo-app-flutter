import 'package:flutter/material.dart';
import 'package:todo_app/components/floatingButton.dart';
import 'package:todo_app/screens/todo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List todoList = [
    ['Learn Flutter', false],
  ];
  final textController = TextEditingController();
  final editTextController = TextEditingController();
  void onChanged(int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  // Function to convert string to title case
  String toTitleCase(String text) {
    return text.split(' ').map((word) {
      if (word.isEmpty) return '';
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }

  void addNewTask() {
    setState(() {
      String titleCasedTask = toTitleCase(textController.text);

      todoList.add([titleCasedTask, false]);
      textController.clear();
    });
  }

  void onDeleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  void onUpdateTask(int index) {
    setState(() {
      todoList[index][0] = editTextController.text;
      editTextController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text(
            'Todo App',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 90),
            child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Todo(
                      taskName: todoList[index][0],
                      taskCompleted: todoList[index][1],
                      onTaskChanged: (value) => onChanged(index),
                      deleteTask: () => onDeleteTask(index),
                      onUpdateTask: () => onUpdateTask(index),
                      editTextController: editTextController);
                }),
          ),
        ),
        floatingActionButton: FloatingButton(
            textController: textController, addNewTask: addNewTask));
  }
}
