import 'package:flutter/material.dart';

void customSnackbarWidget(BuildContext context,
    {required String message,
    Color? color,
    double? width,
    EdgeInsetsGeometry? margin}) {
  final snackBar = SnackBar(
      content: Center(child: Text(message, textAlign: TextAlign.center)),
      backgroundColor: color ?? Colors.red,
      shape: const StadiumBorder(),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      width: width,
      margin: margin);
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
