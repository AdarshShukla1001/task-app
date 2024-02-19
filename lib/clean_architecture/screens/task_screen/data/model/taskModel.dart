// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'dart:convert';

import 'package:fireapp/clean_architecture/screens/task_screen/domain/entity/task_entity.dart';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToJson(TaskModel data) => json.encode(data.toJson());

class TaskModel extends TaskEntity {
  // @override
  String? id;
  String? description;
  bool? done;
  String? name;
  String? saved;
  String? user_id;

  TaskModel({
    required this.id,
    required this.description,
    required this.done,
    required this.name,
    required this.saved,
    required this.user_id,
  }) : super(id: id, description: description, name: name, done: done, saved: saved!, user_id: user_id!);

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        description: json["description"],
        done: json["done"],
        name: json["name"],
        saved: json["saved"],
        user_id: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "done": done,
        "name": name,
        "saved": saved,
        "user_id": user_id,
      };

  factory TaskModel.fromEntity(TaskEntity entity) {
    return TaskModel(description: entity.description, done: entity.done, id: entity.id, name: entity.name, saved: entity.saved, user_id: entity.user_id);
  }
}
