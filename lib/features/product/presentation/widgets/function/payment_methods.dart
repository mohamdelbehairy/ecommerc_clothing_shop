import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../home/data/models/product_model.dart';
import '../../../../payment/presentation/manager/currency/currency_cubit.dart';
import '../../../../payment/presentation/widgets/function/pay_with_card.dart';
import '../../../../payment/presentation/widgets/function/pay_with_paymob.dart';

Future<void> paymentMethods(BuildContext context,
    {required ProductModel productData}) async {
  var buildAppCubit = context.read<BuildAppCubit>();
  var getCurrency = await context.read<CurrencyCubit>().getCurrency();

  var price = num.parse(productData.price);
  var totalPrice =
      (price * buildAppCubit.quantity) + buildAppCubit.shippingCost;

  num currency = num.parse(getCurrency);
  num paymobPrice = totalPrice * currency;
  paymobPrice = double.parse(paymobPrice.toStringAsFixed(2));

  if (buildAppCubit.paymentIndex == 0) {
    // ignore: use_build_context_synchronously
    await payWithCard(context, totalPrice: totalPrice);
  } else if (buildAppCubit.paymentIndex == 1) {
    // ignore: use_build_context_synchronously
    payWithPaymob(context, paymobPrice);
  }
}
