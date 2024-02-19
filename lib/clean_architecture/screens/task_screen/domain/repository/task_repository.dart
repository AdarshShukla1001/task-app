import 'package:fireapp/clean_architecture/screens/task_screen/domain/entity/task_entity.dart';
import 'package:fireapp/clean_architecture/utils/data_state.dart';

abstract class TaskRepository {
  // API methods
  Future<DataState<List<TaskEntity>>> getTask();

  // Database methods
  Future<List<TaskEntity>> getTaskLocal();

  Future<DataState<bool>> addTask(TaskEntity task);

  Future<DataState<bool>> editTask(TaskEntity task);

  Future<DataState<bool>> deleteTask(String taskId);
}
