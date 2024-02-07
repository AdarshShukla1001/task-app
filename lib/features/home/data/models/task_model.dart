import 'package:fireapp/features/home/domain/entities/task.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'article', primaryKeys: ['id'])
class TaskModel extends TaskEntity {
  TaskModel({
    int? id,
    String? name,
    String? description,
    bool? done,
    DateTime? deadLine,
    DateTime? completedIn,
  }) : super(
          id: id,
          name: name,
          description: description,
          done: done,
          deadLine: deadLine,
          completedIn: completedIn,
        );

  factory TaskModel.fromJson(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] ?? "",
      name: map['name'] ?? "",
      description: map['description'] ?? "",
      done: map['done'] ?? "",
      deadLine: map['deadLine'] ?? "",
      completedIn: map['completedIn'] ?? '',
    );
  }

  factory TaskModel.fromEntity(TaskEntity entity) {
    return TaskModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      done: entity.done,
      deadLine: entity.deadLine,
      completedIn: entity.completedIn,
    );
  }
}
