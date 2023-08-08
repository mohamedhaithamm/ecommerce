import 'package:e_commerce/domain/entity/auth_result_entity.dart';

abstract class LoginViewStates{}
class LoginInitialState extends LoginViewStates{}
class LoginSuccessState extends LoginViewStates{
  AuthResultEntity resultEntity;
  LoginSuccessState(this.resultEntity);
}
class LoginLoadingState extends LoginViewStates{
  String loadingMessage ;
  LoginLoadingState(this.loadingMessage);
}
class LoginErrorState extends LoginViewStates{
  String errorMessage ;
  LoginErrorState(this.errorMessage);
}