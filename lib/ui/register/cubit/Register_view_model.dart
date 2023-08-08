
import 'package:e_commerce/domain/useCase/register_use_case.dart';
import 'package:e_commerce/ui/register/cubit/Register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewModel extends Cubit<RegisterViewStates>{
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  RegisterUseCase registerUseCase;

  var formKey = GlobalKey<FormState>();

  RegisterViewModel(this.registerUseCase) :super(RegisterInitialState());


  void register()async{
    emit(RegisterLoadingState('Loading...'));
    var either = await
    registerUseCase.invoke(nameController.text, emailController.text,
        mobileController.text, passwordController.text, rePasswordController.text);


    either.fold((l) => emit(RegisterErrorState(l.errorMessage)),
            (response) => emit(RegisterSuccessState(response)));
  }
}