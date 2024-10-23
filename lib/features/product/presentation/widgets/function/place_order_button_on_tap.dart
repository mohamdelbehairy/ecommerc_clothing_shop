import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../home/data/models/product_model.dart';
import '../../../../payment/presentation/widgets/function/pay_with_card.dart';
import 'no_shipping_payment_snackbar.dart';

Future<void> placeOrderButtonOnTap(BuildContext context,
    {required ProductModel productData}) async {
  var buildAppCubit = context.read<BuildAppCubit>();
  var price = num.parse(productData.price);
  var totalPrice =
      (price * buildAppCubit.quantity) + buildAppCubit.shippingCost;

  if (buildAppCubit.isEmptyDetails().isNotEmpty) {
    noShippingAndPaymentSnackbar(context, buildAppCubit.isEmptyDetails());
  } else {
    if (buildAppCubit.paymentIndex == 0) {
      await payWithCard(context, totalPrice: totalPrice);
    }
  }
}
