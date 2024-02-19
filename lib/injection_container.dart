import 'package:fireapp/clean_architecture/core/data/sources/remote/task/task_api_imp.dart';
import 'package:fireapp/clean_architecture/screens/task_screen/data/repository/task_repository_impl.dart';
import 'package:fireapp/clean_architecture/screens/task_screen/domain/repository/task_repository.dart';
import 'package:fireapp/clean_architecture/screens/task_screen/domain/usecase/add_task.dart';

import 'package:fireapp/clean_architecture/screens/task_screen/domain/usecase/edit_task.dart';
import 'package:fireapp/clean_architecture/screens/task_screen/domain/usecase/delete_task.dart';
import 'package:fireapp/clean_architecture/screens/task_screen/domain/usecase/get_task.dart';
import 'package:fireapp/clean_architecture/screens/task_screen/page/bloc/task_bloc/task_bloc.dart';
import 'package:fireapp/clean_architecture/screens/task_screen/page/bloc/task_bloc/task_event.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:fireapp/clean_architecture/core/data/sources/remote/task/task_api.dart';


final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  // final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  // sl.registerSingleton<AppDatabase>(database);
  
  // Dio
  // sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<TaskApiImpl>(TaskApiImpl());

  sl.registerSingleton<TaskRepository>(
    TaskRepositoryImp(sl())
  );
  
  //UseCases
  sl.registerSingleton<GetTaskUseCase>(
    GetTaskUseCase(sl())
  );

  // sl.registerSingleton<GetSavedArticleUseCase>(
  //   GetSavedArticleUseCase(sl())
  // );

  sl.registerSingleton<AddTaskUseCase>(
    AddTaskUseCase(sl())
  );

   sl.registerSingleton<EditTaskUseCase>(
    EditTaskUseCase(sl())
  );
  
  sl.registerSingleton<DeleteTaskUseCase>(
    DeleteTaskUseCase(sl())
  );


  //Blocs
  sl.registerFactory<RemoteTaskBloc>(
    ()=> RemoteTaskBloc(sl(),sl(),sl(),sl())
  );



}