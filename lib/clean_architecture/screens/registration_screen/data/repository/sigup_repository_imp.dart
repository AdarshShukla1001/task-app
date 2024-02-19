
import 'package:fireapp/clean_architecture/core/data/sources/remote/firebase/firebase_api.dart';
import 'package:fireapp/clean_architecture/screens/registration_screen/domain/repository/signup_repository.dart';
import 'package:fireapp/clean_architecture/utils/data_state.dart';

class SignUpRepositoryImp implements SignUpRepository{
  
  final FirebaseApi firebaseApi;

  SignUpRepositoryImp(this.firebaseApi);

  @override
  Future<DataState<bool>> signup(String email, String password) async {

   return await firebaseApi.signup( email: email, password: password);
  }
  
}