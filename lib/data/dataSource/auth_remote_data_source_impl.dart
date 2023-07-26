import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/data/api/response/LoginResponse.dart';
import 'package:e_commerce/data/api/response/registerResponse.dart';
import 'package:e_commerce/domain/dataSource/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  ApiManger apiManger;
  AuthRemoteDataSourceImpl(this.apiManger);
  @override
  Future<LoginResponse> login(String email, String password) {
   return apiManger.login(email, password);
  }

  @override
  Future<RegisterResponse> register(String name, String email, String phone, String password, String rePassword) {
    return apiManger.register(name, email, phone, password, rePassword);
  }
  
}
AuthRemoteDataSource injectAuthRemoteDataSource(){
  return AuthRemoteDataSourceImpl(ApiManger.getInstance());
}
