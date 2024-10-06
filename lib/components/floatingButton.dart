import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton(
      {super.key, required this.textController, this.addNewTask});

  final TextEditingController textController;
  final void Function()? addNewTask;
  @override
  Widget build(BuildContext context) {
    return Row(
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
              fillColor: const Color.fromARGB(255, 194, 243, 232),
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
    );
  }
}
