
import 'package:equatable/equatable.dart';

import 'package:fireapp/clean_architecture/screens/task_screen/domain/entity/task_entity.dart';


abstract class RemoteTaskState extends Equatable {
  final List<TaskEntity> ? articles;
  final bool? success;
  final String ? error;
  
  const RemoteTaskState({
    this.articles,
    this.success,
    this.error,
  });
  
  // @override
  // List<Object> get props => [articles,success,error];

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class RemoteTaskLoading extends RemoteTaskState {
  const RemoteTaskLoading();
}

class RemoteTaskDone extends RemoteTaskState {
  const RemoteTaskDone(List<TaskEntity> article) : super(articles: article);
}

class RemoteTaskError extends RemoteTaskState {
  const RemoteTaskError(String ? error) : super(error: error);
}

class RemoteTaskBackDone extends RemoteTaskState {
  const RemoteTaskBackDone(bool success) : super(success:success);
}