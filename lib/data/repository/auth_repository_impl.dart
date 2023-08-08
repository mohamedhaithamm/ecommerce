import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/base_error.dart';
import 'package:e_commerce/data/dataSource/auth_remote_data_source_impl.dart';
import 'package:e_commerce/domain/dataSource/auth_remote_data_source.dart';
import 'package:e_commerce/domain/entity/auth_result_entity.dart';
import 'package:e_commerce/domain/repository/AuthRepository.dart';

class AuthRepositoryImpl implements AuthRepository{
  AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<BaseError, AuthResultEntity>> login(String email, String password) {
    return remoteDataSource.login(email, password);
  }

  @override
  Future<Either<BaseError, AuthResultEntity>> register(String name, String email, String phone, String password, String rePassword) {
    return remoteDataSource.register(name, email, phone, password, rePassword);
  }

}

AuthRepository injectAuthRepository(){
  return AuthRepositoryImpl(injectAuthRemoteDataSource());
}