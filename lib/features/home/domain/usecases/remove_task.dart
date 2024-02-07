import 'package:fireapp/core/usecases/usecase.dart';
import 'package:fireapp/features/home/domain/entities/task.dart';
import 'package:fireapp/features/home/domain/repository/task_repository.dart';

class RemoveTaskUseCase implements UseCase<void,TaskEntity>{
  
  final TaskRespository _taskRepository;

  RemoveTaskUseCase(this._taskRepository);
  
  @override
  Future<void> call({TaskEntity ? params}) {
    return _taskRepository.removeTask(params!);
  }
  
}