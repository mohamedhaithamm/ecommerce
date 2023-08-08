import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/base_error.dart';
import 'package:e_commerce/data/repository/auth_repository_impl.dart';
import 'package:e_commerce/domain/entity/auth_result_entity.dart';
import 'package:e_commerce/domain/repository/AuthRepository.dart';

class LoginUseCase{
  AuthRepository repository ;
  LoginUseCase(this.repository);

  Future<Either<BaseError, AuthResultEntity>>invoke(String email, String password){
    return repository.login(email, password);
  }
}

LoginUseCase injectLoginUseCase(){
  return LoginUseCase(injectAuthRepository());
}