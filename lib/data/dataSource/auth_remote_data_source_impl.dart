import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/data/api/base_error.dart';
import 'package:e_commerce/domain/dataSource/auth_remote_data_source.dart';
import 'package:e_commerce/domain/entity/auth_result_entity.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  ApiManger apiManger;
  AuthRemoteDataSourceImpl(this.apiManger);
  @override
  Future<Either<BaseError,AuthResultEntity>> login(String email, String password)async{
    var either = await apiManger.login(email, password);
    return either.fold((error){
      return Left(error);
    },
            (response) {
      return Right(response.toAuthResultEntity());
            });

  }

  @override
  Future<Either<BaseError, AuthResultEntity>> register(
      String name, String email, String phone,
      String password, String rePassword)async{
    var either = await apiManger.register(name, email, phone, password, rePassword);
    return either.fold((error) => Left(error), (response) => Right(response.toAuthResultEntity()));
  }
  
}
AuthRemoteDataSource injectAuthRemoteDataSource(){
  return AuthRemoteDataSourceImpl(ApiManger.getInstance());
}
