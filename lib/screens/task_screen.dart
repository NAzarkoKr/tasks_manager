import 'package:flutter/material.dart';
import 'package:task_manager/bloc/bloc_exports.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);
  static const id = 'tasks_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<TaskModel> tasks = state.pendingTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  '${tasks.length} Tasks | ${state.completedTasks.length} Completed ',
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
