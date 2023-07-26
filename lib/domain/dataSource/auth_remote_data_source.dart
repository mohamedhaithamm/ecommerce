import 'package:e_commerce/data/api/response/LoginResponse.dart';
import 'package:e_commerce/data/api/response/registerResponse.dart';

abstract class AuthRemoteDataSource{
  Future<RegisterResponse> register(String name, String email, String phone, String password,
      String rePassword);
  Future<LoginResponse> login(String email , String password);
}

