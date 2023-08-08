
import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/base_error.dart';
import 'package:e_commerce/domain/entity/auth_result_entity.dart';

abstract class AuthRemoteDataSource{
  Future<Either<BaseError, AuthResultEntity>> register(String name, String email, String phone, String password,
      String rePassword);
  Future<Either<BaseError, AuthResultEntity>> login(String email , String password);
}

