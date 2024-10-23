import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/features/payment/presentation/manager/strip/strip_payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../../core/widgets/function/custom_snack_bar_widget.dart';

Future<void> placeOrderButtonOnTap(BuildContext context) async {
  var buildAppCubit = context.read<BuildAppCubit>();
  if (buildAppCubit.isEmptyDetails().isNotEmpty) {
    customSnackbarWidget(context,
        margin: const EdgeInsets.symmetric(vertical: 70, horizontal: 60),
        color: AppColors.primaryColor,
        message: buildAppCubit.isEmptyDetails());
  } else {
    if (buildAppCubit.paymentIndex == 0) {
      await context.read<StripPaymentCubit>().makePayment();
    }
  }
}
