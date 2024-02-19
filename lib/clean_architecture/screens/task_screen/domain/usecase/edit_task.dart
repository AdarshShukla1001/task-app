import 'package:fireapp/clean_architecture/screens/task_screen/domain/entity/task_entity.dart';
import 'package:fireapp/clean_architecture/screens/task_screen/domain/repository/task_repository.dart';
import 'package:fireapp/clean_architecture/utils/data_state.dart';
import 'package:fireapp/clean_architecture/utils/usecase.dart';

class EditTaskUseCase implements AsyncUseCase<TaskEntity, DataState<bool>> {
  final TaskRepository _taskRepository;

  EditTaskUseCase(this._taskRepository);

  @override
  Future<DataState<bool>> call({required TaskEntity input}) async {
    return await _taskRepository.editTask(input);
  }
  
}
