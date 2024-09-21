import 'package:flutter/material.dart';
import 'package:todo_app/screens/todo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List todoList = [
    ['Learn Flutter', false],
    ['Learn Nextjs', false],
    // ['Learn Tailwind Css', false],
  ];
  final textController = TextEditingController();
  final editTextController = TextEditingController();
  void onChanged(int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void addNewTask() {
    setState(() {
      todoList.add([textController.text, false]);
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
      body: ListView.builder(
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
      floatingActionButton: Row(
        children: [
          Expanded(
              child: Padding(
            padding:
                const EdgeInsets.only(top: 0, bottom: 0, right: 10, left: 25),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: 'Add a new Todo items',
                filled: true,
                fillColor: Color.fromARGB(255, 194, 243, 232),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.teal)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.teal)),
              ),
            ),
          )),
          FloatingActionButton(
              onPressed: addNewTask,
              backgroundColor: Colors.teal,
              elevation: 8,
              hoverColor: const Color.fromARGB(255, 97, 202, 192),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
