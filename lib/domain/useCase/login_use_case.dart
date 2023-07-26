import 'package:e_commerce/data/api/response/LoginResponse.dart';
import 'package:e_commerce/data/repository/auth_repository_impl.dart';
import 'package:e_commerce/domain/repository/AuthRepository.dart';

class LoginUseCase{
  AuthRepository repository ;
  LoginUseCase(this.repository);

  Future<LoginResponse>invoke(String email, String password){
    return repository.login(email, password);
  }
}

LoginUseCase injectLoginUseCase(){
  return LoginUseCase(injectAuthRepository());
}