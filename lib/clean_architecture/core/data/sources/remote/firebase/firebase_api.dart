import 'package:fireapp/clean_architecture/utils/data_state.dart';

abstract class FirebaseApi{
  Future<DataState<bool>> login({required String email,required String password});

  Future<DataState<bool>> signup({required String email,required String password});
}


