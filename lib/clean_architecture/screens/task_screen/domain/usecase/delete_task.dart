import 'package:fireapp/clean_architecture/screens/task_screen/domain/repository/task_repository.dart';
import 'package:fireapp/clean_architecture/utils/data_state.dart';
import 'package:fireapp/clean_architecture/utils/usecase.dart';

class DeleteTaskUseCase implements AsyncUseCase<String, DataState<bool>> {
  final TaskRepository _taskRepository;

  DeleteTaskUseCase(this._taskRepository);

  @override
  Future<DataState<bool>> call({required String input}) async {
    return await _taskRepository.deleteTask(input);
  }
  
}
