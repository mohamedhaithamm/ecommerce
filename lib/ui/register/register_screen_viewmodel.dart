import 'package:e_commerce/domain/repository/AuthRepository.dart';
import 'package:e_commerce/ui/register/register_screen_navigator.dart';
import 'package:flutter/material.dart';

class RegisterScreenViewModel extends ChangeNotifier {
  late RegisterScreenNavigator navigator;
  AuthRepository repositoryContract;
  RegisterScreenViewModel(this.repositoryContract);

  void register(String name, String email, String phone, String password,
      String rePassword) async {
    // show loading
    navigator.showLoading();
    try {
      var response =
          await repositoryContract.register(name, email, phone, password, rePassword);

      if (response == null) {
        // hide loading
        navigator.hideLoading();

        // //show message
        // navigator.showMessage(
        //   response ?? "Error",
        //   posActionTitle: 'Ok',
        // );

      } else {
        //  hide loading
        navigator.hideLoading();

        // show message
        navigator.showMessage("Register Successfully \n ${response}",
            negActionTitle: "Ok",
          posAction: (){
          //navigate to home screen
          }
        );
      }
    } catch (e) {
      // hide loading
      navigator.hideLoading();

      // show message
      navigator.showMessage(e.toString(), posActionTitle: "OK");
    }
  }
}
