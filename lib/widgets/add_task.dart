import 'package:flutter/material.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/bloc/bloc_exports.dart';
import 'package:task_manager/services/id_generat.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            'Add Task',
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
                  var task = TaskModel(
                      description: descriptionController.text,
                      title: titleController.text,
                      date: DateTime.now().toString(),
                      id: IDGen.generate());
                  context.read<TasksBloc>().add(AddTask(task: task));
                  Navigator.of(context).pop();
                },
                child: const Text('Add'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
