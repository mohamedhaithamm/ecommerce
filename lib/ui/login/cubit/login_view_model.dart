import 'package:e_commerce/ui/login/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/useCase/login_use_case.dart';

class LoginViewModel extends Cubit<LoginViewStates>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  LoginUseCase loginUseCase;

  LoginViewModel(this.loginUseCase) :super(LoginInitialState());


  void login()async{
    emit(LoginLoadingState('Loading...'));
    var either = await
   loginUseCase.invoke(emailController.text, passwordController.text);
    either.fold((l) => emit(LoginErrorState(l.errorMessage)),
            (response) => emit(LoginSuccessState(response)));
  }
}