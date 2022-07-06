import 'package:flutter/material.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/widgets/list_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: tasks
              .map((task) => ExpansionPanelRadio(
                  value: task.id,
                  headerBuilder: (context, isOpen) =>
                      CustomListTile(task: task),
                  body: Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: ListTile(
                      title: SelectableText.rich(TextSpan(children: [
                        const TextSpan(
                            text: 'Text:\n',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: task.title),
                        const TextSpan(
                            text: '\n\nDescription:\n',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: task.description),
                      ])),
                    ),
                  )))
              .toList(),
        ),
      ),
    );
  }
}


// Expanded(
//       child: ListView.builder(
//           itemCount: tasks.length,
//           itemBuilder: (context, index) {
//             var task = tasks[index];
//             return CustomListTile(task: task);
//           }),
//     );
