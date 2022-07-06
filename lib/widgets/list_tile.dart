import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/bloc/bloc_exports.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/widgets/edit_task.dart';
import 'package:task_manager/widgets/popup_menu.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.task,
  }) : super(key: key);
  final TaskModel task;

  void _removeOrDeleteTask(BuildContext context, TaskModel task) {
    task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTask(task: task))
        : context.read<TasksBloc>().add(RemovedTask(task: task));
  }

  void _editeTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: EditTaskScreen(
                  oldTask: task,
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                task.isFavorite == false
                    ? const Icon(Icons.star_outline)
                    : const Icon(Icons.star),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          decoration:
                              task.isDone! ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      Text(DateFormat()
                          .add_yMMMd()
                          .add_Hms()
                          .format(DateTime.parse(task.date))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Checkbox(
                  value: task.isDone,
                  onChanged: task.isDeleted == false
                      ? (value) {
                          context.read<TasksBloc>().add(UpdateTask(task: task));
                        }
                      : null),
              CustomPopUpMenu(
                task: task,
                restoreTask: () =>
                    context.read<TasksBloc>().add(RestoreTask(task: task)),
                cancelOrDelete: () => _removeOrDeleteTask(context, task),
                likeOrDislike: () => context
                    .read<TasksBloc>()
                    .add(MarkFavoriteOrUnfavoriteTask(task: task)),
                editTask: () {
                  Navigator.of(context).pop();
                  _editeTask(context);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}



// ListTile(
//       onLongPress: () => _removeOrDeleteTask(context, task),
//       title: Text(
//         task.title,
//         overflow: TextOverflow.ellipsis,
//         style: TextStyle(
//           decoration: task.isDone! ? TextDecoration.lineThrough : null,
//         ),
//       ),
//       trailing: Checkbox(
//           value: task.isDone,
//           onChanged: task.isDeleted == false
//               ? (value) {
//                   context.read<TasksBloc>().add(UpdateTask(task: task));
//                 }
//               : null),
//     );