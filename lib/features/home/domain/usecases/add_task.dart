import 'package:fireapp/core/resources/data_state.dart';
import 'package:fireapp/core/usecases/usecase.dart';
import 'package:fireapp/features/home/domain/entities/task.dart';
import 'package:fireapp/features/home/domain/repository/task_repository.dart';

class AddTaskUseCase implements UseCase<void,TaskEntity> {
  final TaskRespository _taskRespository;

  AddTaskUseCase(this._taskRespository);
  @override
  Future<void> call({TaskEntity ? params}) {
    return _taskRespository.saveTask(params!);
  }
  
}
