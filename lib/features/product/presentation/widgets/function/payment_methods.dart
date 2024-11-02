import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../home/data/models/product_model.dart';
import '../../../../payment/presentation/widgets/function/pay_with_card.dart';
import '../../../../payment/presentation/widgets/function/pay_with_paymob.dart';
import '../../../../payment/presentation/widgets/function/pay_with_paypal.dart';

Future<void> paymentMethods(BuildContext context,
    {required ProductModel productData}) async {
  var buildApp = context.read<BuildAppCubit>();

  var price = num.parse(productData.price);
  var totalPrice = (price * buildApp.quantity) + buildApp.shippingCost;

  var discount = (totalPrice * buildApp.discountPercent / 100).toStringAsFixed(2);

  if (buildApp.paymentIndex == 0) {
    // ignore: use_build_context_synchronously
    await payWithCard(context,
        totalPrice:
            buildApp.isCouponApplied ? (totalPrice - num.parse(discount)) : totalPrice);
  } else if (buildApp.paymentIndex == 1) {
    // ignore: use_build_context_synchronously
    payWithPaymob(context,
        totalPrice:
            buildApp.isCouponApplied ? (totalPrice - num.parse(discount)) : totalPrice,
        productData: productData);
  } else {
    // ignore: use_build_context_synchronously
    payWithPayPal(context, productData: productData);
  }
}
