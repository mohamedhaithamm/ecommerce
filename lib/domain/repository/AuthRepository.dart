
import 'package:e_commerce/data/api/response/registerResponse.dart';

import '../../data/api/response/LoginResponse.dart';

abstract class AuthRepository{
  Future<RegisterResponse> register(String name, String email, String phone, String password,
      String rePassword);
  Future<LoginResponse> login(String email , String password);
}