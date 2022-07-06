part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<TaskModel> pendingTasks;
  final List<TaskModel> completedTasks;
  final List<TaskModel> favoriteTasks;

  final List<TaskModel> removedTasks;
  const TasksState(
      {this.pendingTasks = const <TaskModel>[],
      this.completedTasks = const <TaskModel>[],
      this.favoriteTasks = const <TaskModel>[],
      this.removedTasks = const <TaskModel>[]});

  @override
  List<Object> get props =>
      [pendingTasks, completedTasks, favoriteTasks, removedTasks];

  Map<String, dynamic> toMap() {
    return {
      'pendingTasks': pendingTasks.map((e) => e.toMap()).toList(),
      'completedTasks': completedTasks.map((e) => e.toMap()).toList(),
      'favoriteTasks': favoriteTasks.map((e) => e.toMap()).toList(),
      'removedTasks': removedTasks.map((e) => e.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
        pendingTasks: List<TaskModel>.from(
            map['pendingTasks']?.map((e) => TaskModel.fromMap(e))),
        completedTasks: List<TaskModel>.from(
            map['completedTasks']?.map((e) => TaskModel.fromMap(e))),
        favoriteTasks: List<TaskModel>.from(
            map['favoriteTasks']?.map((e) => TaskModel.fromMap(e))),
        removedTasks: List<TaskModel>.from(
            map['removedTasks']?.map((e) => TaskModel.fromMap(e))));
  }
}
