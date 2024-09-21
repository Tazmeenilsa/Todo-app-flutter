import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Todo extends StatelessWidget {
  const Todo(
      {super.key,
      required this.taskCompleted,
      required this.taskName,
      required this.onTaskChanged,
      required this.deleteTask,
      required this.editTextController,
      this.onUpdateTask});

  final String taskName;
  final TextEditingController editTextController;
  final bool taskCompleted;
  final Function(bool?)? onTaskChanged;
  final Function()? deleteTask;
  final Function()? onUpdateTask;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 15, left: 15, bottom: 0),
      child: Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 5, 155, 120),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                    checkColor: Colors.green,
                    activeColor: Colors.white,
                    side: const BorderSide(color: Colors.white),
                    value: taskCompleted,
                    onChanged: onTaskChanged),
                Text(
                  taskName,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationColor: Colors.white,
                      decorationThickness: 2),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    editTextController.text = taskName;
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Update Task'),
                            content: TextField(
                              controller: editTextController,
                              decoration: InputDecoration(
                                hintText: 'Update Todo item',
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 194, 243, 232),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        const BorderSide(color: Colors.teal)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        const BorderSide(color: Colors.teal)),
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    onUpdateTask!();
                                    Navigator.pop(context);
                                  },
                                  child: Text('Update'))
                            ],
                          );
                        });
                  },
                  icon: const Icon(
                    Icons.edit,
                    size: 30,
                    color: Color.fromARGB(255, 169, 224, 198),
                  ),
                ),
                IconButton(
                  onPressed: deleteTask != null
                      ? () => deleteTask!()
                      : null, // Call the function directly

                  icon: const Icon(
                    Icons.delete,
                    size: 30,
                    color: Color.fromARGB(255, 245, 100, 100),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
