import 'package:e_commerce/styles/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CusttomButtonWidget extends StatelessWidget {
  String title;
  void Function()? onPressed;

  CusttomButtonWidget({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.whiteColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          onPressed: onPressed,
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          )),
    );
  }
}
