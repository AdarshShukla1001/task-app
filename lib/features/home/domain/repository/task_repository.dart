import 'package:fireapp/core/resources/data_state.dart';
import 'package:fireapp/features/home/domain/entities/task.dart';

abstract class TaskRespository {
  // API methods
  Future<DataState<List<TaskEntity>>> getTask();


  Future < void > saveTask(TaskEntity article);

  Future < void > removeTask(TaskEntity article);
}