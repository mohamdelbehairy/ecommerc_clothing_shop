import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/function/custom_snack_bar_widget.dart';

void noShippingAndPaymentSnackbar(BuildContext context, String message) {
  return customSnackbarWidget(context,
      margin: const EdgeInsets.symmetric(vertical: 70, horizontal: 80),
      color: AppColors.primaryColor,
      message: message);
}