import 'package:flutter/material.dart';

class DialogUtils {
  static void showProgressDialog(BuildContext context, String message,
      {bool isDismissible = true}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).primaryColor,
            content: Row(
              children: [
                const CircularProgressIndicator(),
                const SizedBox(
                  width: 12,
                ),
                Text(message),
              ],
            ),
          );
        },
        barrierDismissible: false);
  }

  static void showMessage(BuildContext context, String message,
      {String? posActionTitle,
      VoidCallback? posAction,
      String? negActionTitle,
      VoidCallback? negAction,
      bool isDismissible = true}) {
    showDialog(
      
        context: context,
        builder: (BuildContext) {
          List<Widget>? actions = [];
          if (posActionTitle != null) {
            actions.add(TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (posAction != null) posAction();
                },
                child: Text(posActionTitle,style: TextStyle(
                  color: Colors.white
                ),)));
          }
          if (negActionTitle != null) {
            actions.add(TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (negAction != null) {
                    negAction();
                  }
                },
                child: Text(negActionTitle)));
          }
          return AlertDialog(
            backgroundColor: Theme.of(context).primaryColor,
            content: Text(message),
            actions: actions,
          );
        },
        barrierDismissible: isDismissible);
  }

  static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }

}
