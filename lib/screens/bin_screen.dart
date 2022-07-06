import 'package:flutter/material.dart';
import 'package:task_manager/bloc/bloc_exports.dart';
import 'package:task_manager/screens/drawer.dart';
import 'package:task_manager/widgets/tasks_list.dart';

class BinScreen extends StatelessWidget {
  static const id = 'bin_screen';
  const BinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Bin'),
          actions: [
            PopupMenuButton(
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: TextButton.icon(
                            onPressed: null,
                            icon: const Icon(Icons.delete_forever),
                            label: const Text('Delete all')),
                        onTap: () =>
                            context.read<TasksBloc>().add(DeleteAllTasks()),
                      ),
                    ])
          ],
        ),
        drawer: const CustomDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  '${state.removedTasks.length} Tasks',
                ),
              ),
            ),
            TasksList(tasks: state.removedTasks),
          ],
        ),
      );
    });
  }
}
