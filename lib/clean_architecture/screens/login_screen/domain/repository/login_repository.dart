import 'package:fireapp/clean_architecture/utils/data_state.dart';

abstract class LoginRespository{

  Future<DataState<bool>> login(String email, String password);

}