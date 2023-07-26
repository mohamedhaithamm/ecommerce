import 'package:e_commerce/ui/login/login_navigator.dart';
import 'package:flutter/material.dart';

import '../../domain/repository/AuthRepository.dart';

class LoginScreenViewModel extends ChangeNotifier{
  AuthRepository repositoryContract;
  LoginScreenViewModel(this.repositoryContract);
  late LoginNavigator navigator;

  login(String email, String password)async{
    //show loading
    navigator.showLoading();
    try{
      var response = await repositoryContract.login(email, password);
      //hide loading
      navigator.hideLoading();
      //show message
      navigator.showMessage('Login Successfully \n ${response}',
          posActionTitle: "Ok",
          posAction: (){
            //navigate to home screen
          }
      );
    }catch(e){
      //hide loading
      navigator.hideLoading();
      //show message
      navigator.showMessage(e.toString());

    }

  }
}