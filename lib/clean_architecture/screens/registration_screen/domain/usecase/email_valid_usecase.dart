import 'package:fireapp/clean_architecture/utils/data_state.dart';
import 'package:fireapp/clean_architecture/utils/usecase.dart';

 class EmailValidUseCase implements UseCase<String,DataState<bool>>{
  @override
  DataState<bool> call({required String input}) {
    if(input.isNotEmpty && input.contains('@') && input.contains('.')){
      return const DataSuccess(true);
    }
    return const DataFailed('Email is not a valid email address');
  }
  
  
  
}