import 'dart:developer';

import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:e_clot_shop/core/utils/secret_key.dart';
import 'package:e_clot_shop/features/payment/data/models/paypal/item_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment2/flutter_paypal_payment.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../home/data/models/product_model.dart';
import '../../../data/models/paypal/amount_model.dart';

void payWithPayPal(BuildContext context, {required ProductModel productData}) {
  var getData = getTransactionData(context, productData: productData);

  Navigator.of(context).push(MaterialPageRoute(
    builder: (BuildContext context) => PaypalCheckoutView(
      sandboxMode: true,
      clientId: SecretKey.paypalClientID,
      secretKey: SecretKey.paypalSecretKey,
      transactions: [
        {
          "amount": getData.amountModel.toJson(),
          "description": "The payment transaction description.",
          "item_list": getData.itemListModel.toJson(),
        }
      ],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) async {
        log("onSuccess: $params");
        context.read<BuildAppCubit>().productData = productData;
        GoRouter.of(context).go(AppRouter.orderPlacedSuccess);
      },
      onError: (error) {
        log("onError: $error");
        Navigator.pop(context);
      },
      onCancel: () {
        Navigator.pop(context);
      },
    ),
  ));
}

({AmountModel amountModel, ItemListModel itemListModel}) getTransactionData(
    BuildContext context,
    {required ProductModel productData}) {
  var buildAppCubit = context.read<BuildAppCubit>();

  var price = num.parse(productData.price);

  var subtotal = (price * buildAppCubit.quantity);

  var total = subtotal + buildAppCubit.shippingCost;

  AmountModel amountModel = AmountModel(
      total: total.toStringAsFixed(2),
      details: Details(
          subtotal: subtotal.toStringAsFixed(2),
          shipping: "${buildAppCubit.shippingCost}"));

  ItemListModel itemListModel = ItemListModel(items: [
    Items(
        name: productData.name,
        quantity: buildAppCubit.quantity.toInt(),
        price: productData.price),
  ]);

  return (amountModel: amountModel, itemListModel: itemListModel);
}
