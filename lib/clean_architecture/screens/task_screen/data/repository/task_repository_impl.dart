import 'package:fireapp/clean_architecture/core/data/sources/remote/task/task_api.dart';
import 'package:fireapp/clean_architecture/core/data/sources/remote/task/task_api_imp.dart';
import 'package:fireapp/clean_architecture/screens/task_screen/data/model/taskModel.dart';
import 'package:fireapp/clean_architecture/screens/task_screen/domain/entity/task_entity.dart';
import 'package:fireapp/clean_architecture/screens/task_screen/domain/repository/task_repository.dart';
import 'package:fireapp/clean_architecture/utils/data_state.dart';
import 'package:firebase_database/firebase_database.dart';

class TaskRepositoryImp implements TaskRepository {
  final TaskApi _taskapi;

  TaskRepositoryImp(this._taskapi);

  @override
  Future<DataState<bool>> addTask(TaskEntity task) async {
    // Task
    return await _taskapi.addTaskApi(
      name: task.name!,
      description: task.description!,
      done: task.done!,
      saved: task.saved!,
      user_id: task.user_id!,
    );
  }

  @override
  Future<DataState<bool>> deleteTask(String taskId) async {
    return await _taskapi.deleteTaskApi(id: taskId);
  }

  @override
  Future<DataState<bool>> editTask(TaskEntity task) async {
    return await _taskapi.editTaskApi(
      name: task.name!,
      description: task.description!,
      done: task.done!,
      saved: task.saved!,
      user_id: task.user_id!,
      id: task.id!,
    );
  }

  @override
  Future<DataState<List<TaskEntity>>> getTask() async {
    try {
      // Fetch data from Firebase
      DatabaseReference dataSnapshot = await FirebaseDatabase.instance.ref("TaskData");
      final Map<dynamic, dynamic>? values = dataSnapshot as Map?;
      List<TaskModel> tasks = [];
      if (values != null) {
        values.forEach((key, value) {
          tasks.add(TaskModel(
            id: key,
            name: value['name'],
            description: value['description'],
            done: value['done'],
            saved: value['saved'],
            user_id: value['user_id'],
          ));
        });
      }

      return DataSuccess(tasks);
    } catch (e) {
      return const DataFailed('Something went wrong');
    }
  }

  @override
  Future<List<TaskEntity>> getTaskLocal() {
    // TODO: implement getTaskLocal
    throw UnimplementedError();
  }
}
