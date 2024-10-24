import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../home/data/models/product_model.dart';
import 'no_shipping_payment_snackbar.dart';
import 'payment_methods.dart';

Future<void> placeOrderButtonOnTap(BuildContext context,
    {required ProductModel productData}) async {
  var buildAppCubit = context.read<BuildAppCubit>();

  if (buildAppCubit.isEmptyDetails().isNotEmpty) {
    noShippingAndPaymentSnackbar(context, buildAppCubit.isEmptyDetails());
  } else {
    await paymentMethods(context, productData: productData);
  }
}


