import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final bool? done;
  final String? saved;
  final String? user_id;

  const TaskEntity({this.id, this.name, this.description, this.done, required this.saved,required this.user_id});

  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      done,
      saved,
      user_id
    ];
  }
}
