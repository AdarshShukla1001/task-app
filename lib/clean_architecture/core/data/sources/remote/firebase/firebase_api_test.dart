import 'package:fireapp/clean_architecture/core/data/sources/remote/firebase/firebase_api.dart';
import 'package:fireapp/clean_architecture/utils/data_state.dart';

class FirebaseApiTestSuccess implements FirebaseApi {
  @override
  Future<DataState<bool>> login({required String email, required String password}) async {
    return const DataSuccess(true);
  }
  
  @override
  Future<DataState<bool>> signup({required String email, required String password})  async{
    return const DataSuccess(true);
  }
}


class FirebaseApiTestFail implements FirebaseApi {
  @override
  Future<DataState<bool>> login({required String email, required String password}) async {
    return const DataFailed('Unable to login');
  }
  
  @override
  Future<DataState<bool>> signup({required String email, required String password}) async {
        return const DataFailed('Unable to signup');
  }
}
