import 'package:fireapp/clean_architecture/screens/task_screen/domain/entity/task_entity.dart';
import 'package:fireapp/clean_architecture/utils/data_state.dart';

abstract class TaskApi {
  Future<DataState<TaskEntity>> getTask();

  Future<DataState<bool>> addTaskApi({required String name, required String descritpion, bool done = false, String saved, required String user_id});

  Future<DataState<bool>> deleteTaskApi({
    required String id,
  });

  Future<DataState<bool>> editTaskApi({required String id, required name, required descritpion, bool done = false, String saved, required String user_id});
}
