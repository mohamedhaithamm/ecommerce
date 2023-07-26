import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormLabelWidget extends StatelessWidget {
  String label;
  FormLabelWidget({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
