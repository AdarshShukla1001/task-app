import 'package:fireapp/clean_architecture/utils/data_state.dart';

abstract class SignUpRepository {
  
    Future<DataState<bool>> signup(String email, String password);

}