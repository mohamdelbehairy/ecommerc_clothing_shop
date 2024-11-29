import 'dart:developer';

import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:e_clot_shop/core/utils/secret_key.dart';
import 'package:e_clot_shop/features/payment/data/models/paypal/item_list_model.dart';
import 'package:e_clot_shop/features/user_data/data/models/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment2/flutter_paypal_payment.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/presentation/manager/build_app/build_app_cubit.dart';
import '../../../../home/data/models/product_model.dart';
import '../../../../update/presentation/manager/update_data/update_data_cubit.dart';
import '../../../data/models/paypal/amount_model.dart';

void payWithPayPal(BuildContext context,
    {required UserDataModel userData, required ProductModel productData}) {
  var getData = getTransactionData(context, productData: productData);
  var buildApp = context.read<BuildAppCubit>();

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
        buildApp.productData = productData;
        if (userData.shippingAddress != null) {
          buildApp.userData = userData;
        }
        GoRouter.of(context).go(AppRouter.orderPlacedSuccess);
        await context.read<UpdateDataCubit>().updateProductData(
            productID: productData.id,
            value: (productData.sellingCount! +
                context.read<BuildAppCubit>().quantity));
        log("onSuccess: $params");
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
  var buildApp = context.read<BuildAppCubit>();

  var price = num.parse(productData.price);

  var subtotal = (price * buildApp.quantity);

  var total = subtotal + buildApp.shippingCost;

  var discount = total * buildApp.discountPercent / 100;

  AmountModel amountModel = AmountModel(
      total: buildApp.isCouponApplied
          ? (total - discount.toInt()).toStringAsFixed(2)
          : total.toStringAsFixed(2),
      details: Details(
          shippingDiscount: buildApp.isCouponApplied ? discount.toInt() : 0,
          subtotal: subtotal.toStringAsFixed(2),
          shipping: "${buildApp.shippingCost}"));

  ItemListModel itemListModel = ItemListModel(items: [
    Items(
        name: productData.name,
        quantity: buildApp.quantity.toInt(),
        price: productData.price),
  ]);

  return (amountModel: amountModel, itemListModel: itemListModel);
}
