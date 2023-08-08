import 'package:e_commerce/domain/entity/auth_result_entity.dart';

abstract class RegisterViewStates{}
class RegisterInitialState extends RegisterViewStates{}
class RegisterSuccessState extends RegisterViewStates{
  AuthResultEntity resultEntity;
  RegisterSuccessState(this.resultEntity);
}
class RegisterLoadingState extends RegisterViewStates{
  String loadingMessage ;
  RegisterLoadingState(this.loadingMessage);
}
class RegisterErrorState extends RegisterViewStates{
  String errorMessage ;
  RegisterErrorState(this.errorMessage);
}