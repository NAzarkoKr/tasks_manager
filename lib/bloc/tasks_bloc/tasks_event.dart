part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TasksEvent {
  final TaskModel task;
  const AddTask({required this.task});

  @override
  List<Object> get props => [task];
}

class UpdateTask extends TasksEvent {
  final TaskModel task;
  const UpdateTask({required this.task});

  @override
  List<Object> get props => [task];
}

class DeleteAllTasks extends TasksEvent {}

class RemovedTask extends TasksEvent {
  final TaskModel task;
  const RemovedTask({required this.task});

  @override
  List<Object> get props => [task];
}

class DeleteTask extends TasksEvent {
  final TaskModel task;
  const DeleteTask({required this.task});

  @override
  List<Object> get props => [task];
}

class RestoreTask extends TasksEvent {
  final TaskModel task;
  const RestoreTask({required this.task});

  @override
  List<Object> get props => [task];
}

class EditeTask extends TasksEvent {
  final TaskModel oldTask;
  final TaskModel newTask;
  const EditeTask({required this.oldTask, required this.newTask});

  @override
  List<Object> get props => [oldTask, newTask];
}

class MarkFavoriteOrUnfavoriteTask extends TasksEvent {
  final TaskModel task;
  const MarkFavoriteOrUnfavoriteTask({required this.task});

  @override
  List<Object> get props => [task];
}
