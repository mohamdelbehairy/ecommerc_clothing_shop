  import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';

void customSnackbarWidget(BuildContext context, {required String message}) {
    final snackBar = SnackBar(
        content: Center(child: Text(message)),
        backgroundColor: AppColors.primaryColor,
        shape: const StadiumBorder(),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(50));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }