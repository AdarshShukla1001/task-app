import 'package:equatable/equatable.dart';
import 'package:fireapp/clean_architecture/screens/task_screen/domain/entity/task_entity.dart';

abstract class RemoteTaskEvent extends Equatable {
  final TaskEntity ? task;
  const RemoteTaskEvent({this.task});

   @override
  List<Object> get props => [task!];
}

class GetTask extends RemoteTaskEvent {
  const GetTask();
}

class DeleteTask extends RemoteTaskEvent {
  const DeleteTask(TaskEntity task):super(task: task);
}

class EditTask extends RemoteTaskEvent {
  const EditTask(TaskEntity task):super(task: task);
}

class AddTask extends RemoteTaskEvent {
  const AddTask(TaskEntity task):super(task: task);
}
