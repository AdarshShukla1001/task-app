import 'dart:js_interop';

import 'package:fireapp/clean_architecture/screens/task_screen/domain/usecase/add_task.dart';
import 'package:fireapp/clean_architecture/screens/task_screen/domain/usecase/delete_task.dart';
import 'package:fireapp/clean_architecture/screens/task_screen/domain/usecase/edit_task.dart';
import 'package:fireapp/clean_architecture/screens/task_screen/domain/usecase/get_task.dart';
import 'package:fireapp/clean_architecture/screens/task_screen/page/bloc/task_bloc/task_event.dart';
import 'package:fireapp/clean_architecture/screens/task_screen/page/bloc/task_bloc/task_state.dart';
import 'package:fireapp/clean_architecture/utils/data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteTaskBloc extends Bloc<RemoteTaskEvent,RemoteTaskState> {
  
  final GetTaskUseCase _getTaskUseCase;
  final EditTaskUseCase _editTaskUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;
  final AddTaskUseCase _addTaskUseCase;
  


  RemoteTaskBloc(this._getTaskUseCase, this._editTaskUseCase, this._deleteTaskUseCase, this._addTaskUseCase) : super(const RemoteTaskLoading()){
    on <GetTask> (onGetTask);
    on<DeleteTask> (onDeleteTask);
    on<EditTask> (onEditTask);
    on<AddTask> (onAddTask);

    
  }


void onEditTask(EditTask event, Emitter < RemoteTaskState > emit) async {
   

    final dataState = await _editTaskUseCase(input: event.task!);

    if (dataState is DataSuccess ) {
      emit(
       const RemoteTaskBackDone(true)
      );
    }
    
    if (dataState is DataFailed) {
      emit(
        RemoteTaskError(dataState.data.toString())
      );
    }
  }




void onAddTask(AddTask event, Emitter < RemoteTaskState > emit) async {
    
    final dataState = await _addTaskUseCase(input: event.task!);

    if (dataState is DataSuccess ) {
      emit(
       const RemoteTaskBackDone(true)
      );
    }
    
    if (dataState is DataFailed) {
      emit(
        RemoteTaskError(dataState.data.toString())
      );
    }
  }

  



  void onDeleteTask(DeleteTask event, Emitter < RemoteTaskState > emit) async {
    String id = event.task!.id!;
    if(id.isEmpty){
      emit(
       const RemoteTaskError('Id is not specified')
      );
    }

    final dataState = await _deleteTaskUseCase(input: id);

    if (dataState is DataSuccess ) {
      emit(
       const RemoteTaskBackDone(true)
      );
    }
    
    if (dataState is DataFailed) {
      emit(
        RemoteTaskError(dataState.data.toString())
      );
    }
  }

  void onGetTask(GetTask event, Emitter < RemoteTaskState > emit) async {
    final dataState = await _getTaskUseCase();

    if (dataState is DataSuccess && dataState.data!.isNull) {
      emit(
        RemoteTaskDone(dataState.data!)
      );
    }
    
    if (dataState is DataFailed) {
      emit(
        RemoteTaskError(dataState.data.toString())
      );
    }
  }
  
}