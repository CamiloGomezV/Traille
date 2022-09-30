import 'package:flutter/material.dart';
import 'package:traille_app/utils/responsive/responsive.dart';

void showNotification(
    BuildContext context, String message, Responsive responsive,
    {Color? color}) {
  final snackBar = SnackBar(
    content: Text(
      message,
      textAlign: TextAlign.center,
    ),
    backgroundColor: color,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}