import 'package:fireapp/core/resources/data_state.dart';
import 'package:fireapp/core/usecases/usecase.dart';
import 'package:fireapp/features/home/domain/entities/task.dart';
import 'package:fireapp/features/home/domain/repository/task_repository.dart';

class GetTaskUseCase implements UseCase<DataState<List<TaskEntity>>,void>{
  
  final TaskRespository _taskRepository;

  GetTaskUseCase(this._taskRepository);
  
  @override
  Future<DataState<List<TaskEntity>>> call({void params}) {
    return _taskRepository.getTask();
  }
  
}