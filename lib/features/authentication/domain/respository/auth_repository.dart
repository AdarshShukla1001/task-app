import 'package:equatable/equatable.dart';


// .why>??
class AuthEntity  extends Equatable{
  final String? email;
  final String? password;

  AuthEntity({
    this.email,
    this.password
  });
   
     @override
     // TODO: implement props
     List<Object?> get props {
      return [
        email,
        password
      ];
      
     }
}