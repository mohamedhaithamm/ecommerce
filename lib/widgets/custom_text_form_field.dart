import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  String hintText;
  bool isPassword;
  TextEditingController controller;
  String? Function(String?)? validator;
  TextInputType type;

  CustomTextFormField({
    required this.hintText,
    this.isPassword = false,
    required this.controller,
    required this.validator,
    required this.type,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          fillColor: AppColors.whiteColor,
          filled: true,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.titleSmall,
          suffixIcon: isPassword
              ? Image.asset(
                  "assets/images/Eye.png",
                  height: 24,
                  width: 24,
                )
              : null),
      style: Theme.of(context)
          .textTheme
          .titleSmall
          ?.copyWith(color: AppColors.blackColor),
      controller: controller,
      validator: validator,
      keyboardType: type,
      obscureText: isPassword,
    );
  }
}
