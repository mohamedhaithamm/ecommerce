import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/base_error.dart';
import 'package:e_commerce/data/repository/auth_repository_impl.dart';
import 'package:e_commerce/domain/entity/auth_result_entity.dart';
import 'package:e_commerce/domain/repository/AuthRepository.dart';

class RegisterUseCase{
  AuthRepository repository;
  RegisterUseCase(this.repository);

  Future<Either<BaseError, AuthResultEntity>> invoke(String name, String email, String phone,
      String password, String rePassword){
    return repository.register(name, email, phone, password, rePassword);

  }


}
RegisterUseCase injectRegisterUseCase(){
  return RegisterUseCase(injectAuthRepository());
}