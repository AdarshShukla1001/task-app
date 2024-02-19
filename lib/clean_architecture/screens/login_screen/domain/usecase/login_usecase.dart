import 'package:fireapp/clean_architecture/screens/login_screen/domain/repository/login_repository.dart';
import 'package:fireapp/clean_architecture/utils/data_state.dart';
import 'package:fireapp/clean_architecture/utils/usecase.dart';

class LoginUseCase implements AsyncUseCase<LoginInput, DataState<bool>> {
  final LoginRespository loginRespository;

  LoginUseCase({required this.loginRespository});

  @override
  Future<DataState<bool>> call({required LoginInput input}) async {
    if (input.email.isEmpty) {
      return const DataFailed('Email Should not be empty');
    }
    if (input.password.isEmpty) {
      return const DataFailed('Password can not be empty');
    }
    
    return await loginRespository.login(input.email, input.password);
  }
}

class LoginInput {
  final String email;
  final String password;

  LoginInput({required this.email, required this.password});
}
