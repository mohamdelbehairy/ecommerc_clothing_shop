import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../home/data/models/product_model.dart';
import '../../../../payment/presentation/widgets/function/pay_with_card.dart';
import '../../../../payment/presentation/widgets/function/pay_with_paymob.dart';
import '../../../../payment/presentation/widgets/function/pay_with_paypal.dart';

Future<void> paymentMethods(BuildContext context,
    {required ProductModel productData}) async {
  var buildAppCubit = context.read<BuildAppCubit>();

  var price = num.parse(productData.price);
  var totalPrice =
      (price * buildAppCubit.quantity) + buildAppCubit.shippingCost;

  if (buildAppCubit.paymentIndex == 0) {
    // ignore: use_build_context_synchronously
    await payWithCard(context, totalPrice: totalPrice);
  } else if (buildAppCubit.paymentIndex == 1) {
    // ignore: use_build_context_synchronously
    payWithPaymob(context, totalPrice: totalPrice, productData: productData);
  } else {
    // ignore: use_build_context_synchronously
    payWithPayPal(context, productData: productData);
  }
}
