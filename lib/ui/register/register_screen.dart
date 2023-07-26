// ignore_for_file: must_be_immutable

import 'package:e_commerce/dialog_utils.dart';
import 'package:e_commerce/ui/register/cubit/Register_view_model.dart';
import 'package:e_commerce/ui/register/register_screen_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../styles/app_colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/form_label.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register_screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    implements RegisterScreenNavigator {

RegisterViewModel viewModel = RegisterViewModel();

  // RegisterScreenViewModel viewModel = RegisterScreenViewModel(injectAuthRepository());

  // @override
  // void initState() {
  //   super.initState();
  //   viewModel.navigator = this;
  // }

  @override
  Widget build(BuildContext context) {
    return 
      // ChangeNotifierProvider<RegisterScreenViewModel>(
      // create: (context) => viewModel,
      // child: 
      BlocListener(
        listener: ((context,state){

        }) ,
        bloc: viewModel,
        child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.097,
              ),
              Image.asset(
                "assets/images/route.png",
                height: 71,
                width: 237,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: viewModel.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          //route Image
                          //fullname
                          FormLabelWidget(label: "Full Name"),
                          const SizedBox(height: 24),
                          CustomTextFormField(
                              hintText: "enter your full name",
                              controller: viewModel.nameController,
                              validator: (text) {
                                if (text == null || text.trim().isEmpty) {
                                  return "Please enter full name";
                                }
                                return null;
                              },
                              type: TextInputType.name),
                          const SizedBox(
                            height: 32,
                          ),

                          //mobileNumber
                          FormLabelWidget(label: "Mobile Number"),
                          const SizedBox(height: 24),
                          CustomTextFormField(
                              hintText: "enter your mobile no",
                              controller: viewModel.mobileController,
                              validator: (text) {
                                if (text == null || text.trim().isEmpty) {
                                  return "Please enter mobile number";
                                }
                                if (text.trim().length < 10) {
                                  return 'mobile number should be at least 10 numbers';
                                }
                                return null;
                              },
                              type: TextInputType.number),
                          const SizedBox(
                            height: 32,
                          ),

                          //email
                          FormLabelWidget(label: "Email Address"),
                          const SizedBox(height: 24),
                          CustomTextFormField(
                              hintText: "Please enter you email",
                              controller: viewModel.emailController,
                              validator: (text) {
                                if (text == null || text.trim().isEmpty) {
                                  return "Please enter email";
                                }
                                var emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(text);
                                if (!emailValid) {
                                  return 'email format not valid';
                                }
                                return null;
                              },
                              type: TextInputType.emailAddress),
                          const SizedBox(
                            height: 32,
                          ),

                          //password
                          FormLabelWidget(label: "Password"),
                          const SizedBox(height: 24),
                          CustomTextFormField(
                              hintText: "enter your password",
                              controller: viewModel.passwordController,
                              validator: (text) {
                                if (text == null || text.trim().isEmpty) {
                                  return "Please enter password";
                                }
                                if (text.length < 8) {
                                  return 'password should be at least 8 characters';
                                }
                                return null;
                              },
                              type: TextInputType.visiblePassword,
                              isPassword: true),
                          const SizedBox(
                            height: 32,
                          ),

                          //password confirmation
                          FormLabelWidget(label: "Password Confirmation"),
                          const SizedBox(height: 24),
                          CustomTextFormField(
                              hintText: "re enter your password",
                              controller: viewModel.rePasswordController,
                              validator: (text) {
                                if (text == null || text.trim().isEmpty) {
                                  return "Please re enter password";
                                }
                                if (text != viewModel.passwordController.text) {
                                  return "Passwords doesn't match";
                                }
                                return null;
                              },
                              type: TextInputType.visiblePassword,
                              isPassword: true),
                          const SizedBox(
                            height: 32,
                          ),

                          //button => still needs to navigate onPressed function
                          CusttomButtonWidget(
                            title: 'Sign Up',
                            onPressed: () {
                              viewModel.register();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      // ),
    );
  }

  // void register() {
  //   if (formKey.currentState?.validate() == false) {
  //     return;
  //   }
  //   viewModel.register(
  //       nameController.text,
  //       emailController.text,
  //       mobileController.text,
  //       passwordController.text,
  //       rePasswordController.text);
  // }

  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => throw UnimplementedError();

  @override
  void hideLoading() {
    DialogUtils.hideDialog(context);
  }

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }

  @override
  void showLoading() {
    DialogUtils.showProgressDialog(context, "Loading");
  }

  @override
  void showMessage(String message,
      {String? posActionTitle,
      VoidCallback? posAction,
      String? negActionTitle,
      VoidCallback? negAction,
      bool isDismissible = true}) {
    DialogUtils.showMessage(context, message,
        posActionTitle: posActionTitle,
        posAction: posAction,
        negActionTitle: negActionTitle,
        negAction: negAction,
        isDismissible: isDismissible);
  }
}
