import 'package:flutter/material.dart';
import 'package:task_manager/bloc/bloc_exports.dart';
import 'package:task_manager/screens/bin_screen.dart';
import 'package:task_manager/screens/tabs_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
            child: Column(
      children: [
        Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            child: Text(
              'Tasks',
              style: Theme.of(context).textTheme.headline5,
            ),
            color: Colors.grey),
        BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
          return GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(TabsScreen.id),
              child: ListTile(
                leading: const Icon(Icons.folder_special),
                title: const Text('My Tasks'),
                trailing: Text(
                    '${state.pendingTasks.length} | ${state.completedTasks.length}'),
              ));
        }),
        const Divider(),
        BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
          return GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(BinScreen.id),
              child: ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Bin'),
                trailing: Text('${state.removedTasks.length}'),
              ));
        }),
        BlocBuilder<SwitchBloc, SwitchState>(
          builder: (context, state) {
            return Switch(
                value: state.switchValue,
                onChanged: (newValue) {
                  newValue
                      ? context.read<SwitchBloc>().add(SwitchOnEvent())
                      : context.read<SwitchBloc>().add(SwitchOffEvent());
                });
          },
        ),
      ],
    )));
  }
}
