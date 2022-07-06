import 'package:flutter/material.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/bloc/bloc_exports.dart';

class EditTaskScreen extends StatelessWidget {
  const EditTaskScreen({Key? key, required this.oldTask}) : super(key: key);
  final TaskModel oldTask;

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: oldTask.title);
    TextEditingController descriptionController =
        TextEditingController(text: oldTask.description);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            'Edit Task',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: TextField(
              autofocus: true,
              decoration: const InputDecoration(
                  label: Text('Title'), border: OutlineInputBorder()),
              controller: titleController,
            ),
          ),
          TextField(
            maxLines: 5,
            decoration: const InputDecoration(
                label: Text('Description'), border: OutlineInputBorder()),
            controller: descriptionController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  var editedTask = TaskModel(
                      description: descriptionController.text,
                      title: titleController.text,
                      isFavorite: oldTask.isFavorite,
                      isDone: false,
                      date: DateTime.now().toString(),
                      id: oldTask.id);
                  context
                      .read<TasksBloc>()
                      .add(EditeTask(newTask: editedTask, oldTask: oldTask));
                  Navigator.of(context).pop();
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
