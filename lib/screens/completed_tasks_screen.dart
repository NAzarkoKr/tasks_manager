import 'package:flutter/material.dart';
import 'package:task_manager/bloc/bloc_exports.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/widgets/tasks_list.dart';

class CompletedTasksScreen extends StatelessWidget {
  const CompletedTasksScreen({Key? key}) : super(key: key);
  static const id = 'completed_tasks_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<TaskModel> tasks = state.completedTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  '${tasks.length} Tasks',
                ),
              ),
            ),
            TasksList(tasks: tasks),
          ],
        );
      },
    );
  }
}
