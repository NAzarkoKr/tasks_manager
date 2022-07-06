import 'package:flutter/material.dart';
import 'package:task_manager/models/task.dart';

class CustomPopUpMenu extends StatelessWidget {
  const CustomPopUpMenu(
      {Key? key,
      required this.cancelOrDelete,
      required this.likeOrDislike,
      required this.task,
      required this.restoreTask,
      required this.editTask})
      : super(key: key);
  final TaskModel task;
  final VoidCallback cancelOrDelete;
  final VoidCallback likeOrDislike;
  final VoidCallback editTask;
  final VoidCallback restoreTask;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDeleted == false
            ? ((context) => [
                  PopupMenuItem(
                      child: TextButton.icon(
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit'),
                        onPressed: editTask,
                      ),
                      onTap: null),
                  PopupMenuItem(
                    child: TextButton.icon(
                      icon: task.isFavorite == false
                          ? const Icon(Icons.bookmark_add_outlined)
                          : const Icon(Icons.bookmark_remove),
                      label: task.isFavorite == false
                          ? const Text('Add to \nbookmark')
                          : const Text('Remove from \nbookmark'),
                      onPressed: null,
                    ),
                    onTap: likeOrDislike,
                  ),
                  PopupMenuItem(
                    child: TextButton.icon(
                      icon: const Icon(Icons.delete),
                      label: const Text('Delete'),
                      onPressed: null,
                    ),
                    onTap: cancelOrDelete,
                  )
                ])
            : (context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                      icon: const Icon(Icons.restore_from_trash),
                      label: const Text('Restore'),
                      onPressed: null,
                    ),
                    onTap: restoreTask,
                  ),
                  PopupMenuItem(
                    child: TextButton.icon(
                      icon: const Icon(Icons.delete_forever),
                      label: const Text('Delete'),
                      onPressed: null,
                    ),
                    onTap: cancelOrDelete,
                  )
                ]);
  }
}
