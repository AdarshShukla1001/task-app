


import 'package:fireapp/clean_architecture/core/data/sources/remote/task/task_api.dart';
import 'package:fireapp/clean_architecture/core/data/sources/remote/task/task_api_imp.dart';
import 'package:fireapp/clean_architecture/screens/task_screen/data/model/taskModel.dart';
import 'package:fireapp/clean_architecture/screens/task_screen/domain/entity/task_entity.dart';
import 'package:fireapp/clean_architecture/screens/task_screen/domain/repository/task_repository.dart';
import 'package:fireapp/clean_architecture/utils/data_state.dart';

class TaskRepositoryImp implements TaskRepository{
   final TaskApi _taskapi;

  TaskRepositoryImp(this._taskapi);
  
  @override
  Future<DataState<bool>> addTask(TaskEntity task) async {
    // Task
   return await _taskapi.addTaskApi(name: task.name!, description: task.description!, done: task.done!, saved: task.saved!, user_id: task.user_id!, );
  }

  @override
  Future<DataState<bool>> deleteTask(String taskId) async {
    return await _taskapi.deleteTaskApi(id: taskId);
  }

  @override
  Future<DataState<bool>> editTask(TaskEntity task)  async{
    return await _taskapi.editTaskApi(name: task.name!, description: task.description!, done: task.done!, saved: task.saved!, user_id: task.user_id!, id:task.id!, );
  }

  @override
  Future<DataState<List<TaskEntity>>> getTask() {
    
    // try {
    //   // Fetch data from Firebase
    //   DataSnapshot dataSnapshot =
    //       await _database.reference().child('tasks').once();
    //   final Map<dynamic, dynamic>? values = dataSnapshot.value;
    //   List<Task> tasks = [];
    //   if (values != null) {
    //     values.forEach((key, value) {
    //       tasks.add(Task(
    //         id: key,
    //         name: value['name'],
    //         description: value['description'],
    //         done: value['done'],
    //         saved: value['saved'],
    //         userId: value['user_id'],
    //       ));
    //     });
    //   }
    //   yield DataLoaded(tasks: tasks);
    // } catch (e) {
    //   yield DataError(message: 'Failed to fetch data');
    // }
  // }
// }
    // TODO: implement getTask
    throw UnimplementedError();
  }

  @override
  Future<List<TaskEntity>> getTaskLocal() {
    // TODO: implement getTaskLocal
    throw UnimplementedError();
  }

}