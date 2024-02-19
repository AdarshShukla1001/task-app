import 'package:fireapp/clean_architecture/screens/task_screen/domain/entity/task_entity.dart';
import 'package:fireapp/clean_architecture/screens/task_screen/domain/repository/task_repository.dart';
import 'package:fireapp/clean_architecture/utils/data_state.dart';
import 'package:fireapp/clean_architecture/utils/usecase.dart';

class GetTaskUseCase implements AsyncUseCase<void, DataState<List<TaskEntity>>> {
  final TaskRepository _taskRepository;

  GetTaskUseCase(this._taskRepository);

  @override
  Future<DataState<List<TaskEntity>>> call({ void input}) async {
    return await _taskRepository.getTask();
  }
  
}
