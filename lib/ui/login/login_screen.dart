
import 'package:e_commerce/dialog_utils.dart';
import 'package:e_commerce/domain/useCase/login_use_case.dart';
import 'package:e_commerce/ui/login/cubit/login_state.dart';
import 'package:e_commerce/ui/login/cubit/login_view_model.dart';
import 'package:e_commerce/ui/login/login_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/form_label.dart';
import '../../styles/app_colors.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginNavigator {

  // LoginScreenViewModel viewModel = LoginScreenViewModel(injectAuthRepository());

  var formKey = GlobalKey<FormState>();
  LoginViewModel viewModel = LoginViewModel(injectLoginUseCase());
// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     viewModel.navigator = this ;
//   }
  @override
  Widget build(BuildContext context) {
    return 
      // ChangeNotifierProvider<LoginScreenViewModel>(
      // create: (context)=> viewModel ,
      // child: 
      BlocListener<LoginViewModel,LoginViewStates>(
        listener: ((context,state){
          if(state is LoginLoadingState){
            DialogUtils.showProgressDialog(context, state.loadingMessage!);
          }else if(state is LoginErrorState){
            DialogUtils.hideDialog(context);
            DialogUtils.showMessage(context, state.errorMessage!,
                posActionTitle: 'ok'
            );
          }else if(state is LoginSuccessState){
            DialogUtils.hideDialog(context);
            DialogUtils.showMessage(context, 'Login Successfully',
                posActionTitle: 'ok'
            );
          }
        }),
        bloc: viewModel ,

        child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.097,
                    ),

                    //route Image
                    Image.asset(
                      "assets/images/route.png",
                      height: 71,
                      width: 237,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Text(
                      "Welcome Back to Route",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Please sign in with you mail",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 32,
                    ),

                    //EmailAddress
                    FormLabelWidget(label: "Email Address"),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextFormField(
                        hintText: "Enter Your Email",
                        controller: viewModel.emailController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "please enter email";
                          }
                          var validEmail = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(text);
                          if (!validEmail) {
                            return "please enter valid email format";
                          }
                          return null;
                        },
                        type: TextInputType.emailAddress),
                    const SizedBox(
                      height: 32,
                    ),

                    //Password
                    FormLabelWidget(label: "Password"),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextFormField(
                      hintText: "Enter Your Password",
                      controller: viewModel.passwordController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return " enter password";
                        }
                        if (text.length < 8) {
                          return "please enter 8 characters at least";
                        }
                        return null;
                      },
                      type: TextInputType.visiblePassword,
                      isPassword: true,
                    ),

                    const SizedBox(
                      height: 16,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: FormLabelWidget(label: "Forgot Password ?"),
                      ),
                    ),
                    const SizedBox(
                      height: 56,
                    ),
                    CusttomButtonWidget(title: "Login", onPressed: () {
                      viewModel.login();
                    }),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FormLabelWidget(label: "Don't have an account ? "),
                        InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, RegisterScreen.routeName);
                            },
                            child: FormLabelWidget(label: "Create Account")),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        // ),
    ),
      );
  }

  @override
  void hideLoading() {
    DialogUtils.hideDialog(context);
  }

  @override
  void showLoading() {
    DialogUtils.showProgressDialog(context, 'Loading..');
  }

  @override
  void showMessage(String message, {String? posActionTitle, VoidCallback? posAction, String? negActionTitle, VoidCallback? negAction, bool isDismissible = true}) {
    DialogUtils.showMessage(context, message,
       posAction: posAction,
      posActionTitle: posActionTitle,
      isDismissible: isDismissible,
      negAction: negAction,
      negActionTitle: negActionTitle,
    );
  }

 //  void login() {
 //  if(formKey.currentState?.validate() == false){
 //    return;
 // }
  // viewModel.login(emailController.text, passwordController.text);
  }
// }
