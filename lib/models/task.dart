import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final String title;
  final String description;
  final String date;
  final String id;
  bool? isDone;
  bool? isDeleted;
  bool? isFavorite;
  TaskModel({
    required this.title,
    required this.description,
    required this.date,
    required this.id,
    this.isDone,
    this.isFavorite,
    this.isDeleted,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavorite = isFavorite ?? false;
  }

  TaskModel copyWith({
    String? title,
    String? description,
    String? date,
    String? id,
    bool? isDone,
    bool? isDeleted,
    bool? isFavorite,
  }) {
    return TaskModel(
      title: title ?? this.title,
      date: date ?? this.date,
      description: description ?? this.description,
      id: id ?? this.id,
      isDone: isDone ?? this.isDone,
      isFavorite: isFavorite ?? this.isFavorite,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'date': date,
      'description': description,
      'id': id,
      'isDone': isDone,
      'isFavorite': isFavorite,
      'isDeleted': isDeleted,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'] ?? '',
      date: map['date'] ?? '',
      description: map['description'] ?? '',
      id: map['id'] ?? '',
      isDone: map['isDone'],
      isFavorite: map['isFavorite'],
      isDeleted: map['isDeleted'],
    );
  }

  @override
  List<Object?> get props =>
      [title, id, date, isDone, isDeleted, isFavorite, description];
}
