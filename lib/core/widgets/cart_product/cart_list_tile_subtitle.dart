import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/app/presentation/manager/build_app/build_app_cubit.dart';
import '../../models/cart_product_model.dart';
import 'sub_title_add_or_remove_quantity.dart';
import 'sub_title_delivered_or_no_shipped.dart';
import 'sub_title_size_and_color_widget.dart';

class CartListTileSubTitle extends StatelessWidget {
  const CartListTileSubTitle({super.key, required this.cartProduct});

  final CartProductModel cartProduct;

  @override
  Widget build(BuildContext context) {
    var buildApp = context.read<BuildAppCubit>();
    return MediaQuery.sizeOf(context).width >= 375
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SubTitleSizeAndColorWidget(
                  cartProduct: cartProduct,
                  quantity: buildApp.quantity.toString()),
              if (!cartProduct.isOrder && !cartProduct.isProduct)
                const SubTitleAddOrRemoveQuantity(),
              if (cartProduct.isShipped && !cartProduct.isNotify)
                SubTitleDeliveredOrNoshipped(
                    orderData: cartProduct.orderModel!),
            ],
          )
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SubTitleSizeAndColorWidget(
                    cartProduct: cartProduct,
                    quantity: buildApp.quantity.toString()),
                if (!cartProduct.isOrder && !cartProduct.isProduct)
                  const SubTitleAddOrRemoveQuantity(),
                if (cartProduct.isShipped && !cartProduct.isNotify)
                  SubTitleDeliveredOrNoshipped(
                      orderData: cartProduct.orderModel!),
              ],
            ),
          );
  }
}
