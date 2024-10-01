import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';

Future<dynamic> customBottomSheet(
    {required BuildContext context, required Widget child}) {
  return showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.secondaryColor,
      builder: (context) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          width: double.infinity,
          child: child));
}