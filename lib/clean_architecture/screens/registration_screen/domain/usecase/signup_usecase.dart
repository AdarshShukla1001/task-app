import 'package:fireapp/clean_architecture/screens/registration_screen/domain/repository/signup_repository.dart';
import 'package:fireapp/clean_architecture/utils/data_state.dart';
import 'package:fireapp/clean_architecture/utils/usecase.dart';

class SignUpUseCase implements AsyncUseCase< SignUpInput,DataState<bool>>{

  final SignUpRepository signUpRepository;

  SignUpUseCase(this.signUpRepository);

  @override
  Future<DataState<bool>> call({required SignUpInput input}) async {
    if(input.email.isEmpty  || input.password.isEmpty){
      return  const DataFailed('email and password are required');
    }
    return await signUpRepository.signup(input.email, input.password);
  }

}





class SignUpInput{
  final String email;
  final String password;

  SignUpInput(this.email, this.password);
}