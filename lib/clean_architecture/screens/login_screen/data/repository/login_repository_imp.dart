import 'package:fireapp/clean_architecture/core/data/sources/remote/firebase/firebase_api.dart';
import 'package:fireapp/clean_architecture/core/data/sources/remote/firebase/firebase_api_imp.dart';
import 'package:fireapp/clean_architecture/screens/login_screen/domain/repository/login_repository.dart';
import 'package:fireapp/clean_architecture/utils/data_state.dart';

class LoginRespositoryImp implements LoginRespository {
  final FirebaseApi firebaseApi;

  LoginRespositoryImp({required this.firebaseApi});

  @override
  Future<DataState<bool>> login(String email, String password) async {
    return await firebaseApi.login(email: email, password: password);
  }
}

class Adarsh {
  LoginRespository loginRespository = LoginRespositoryImp(firebaseApi: FirebaseApiImp());


}
