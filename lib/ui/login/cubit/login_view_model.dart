import 'package:e_commerce/ui/login/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repository/AuthRepository.dart';
import '../../../domain/useCase/login_use_case.dart';

class LoginViewModel extends Cubit<RegisterViewStates>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  LoginUseCase loginUseCase;

  LoginViewModel(this.loginUseCase) :super(RegisterInitialState());


  void login()async{
    var response = await
   loginUseCase.invoke(emailController.text, passwordController.text);
    // return response;
  }
}