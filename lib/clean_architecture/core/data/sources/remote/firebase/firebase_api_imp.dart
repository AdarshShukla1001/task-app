
import 'package:fireapp/clean_architecture/core/data/sources/remote/firebase/firebase_api.dart';
import 'package:fireapp/clean_architecture/utils/data_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseApiImp implements FirebaseApi {
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Future<DataState<bool>> login({required String email, required String password}) async {
    
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return const DataSuccess(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return const DataFailed('User not found');
      } else if (e.code == 'wrong-password') {
        return const DataFailed('Wrong password');
      }
      return const DataFailed('Something went wrong');
    }

  }
  
  @override
  Future<DataState<bool>> signup({required String email, required String password}) async {
  try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return const DataSuccess(true);
    }  catch (e) {
      
      return const DataFailed('Something went wrong');
    }

  }
}
