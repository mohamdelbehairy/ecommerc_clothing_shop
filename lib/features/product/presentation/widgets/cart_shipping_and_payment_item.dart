import 'package:e_clot_shop/core/models/back_widget_model.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/core/widgets/background_list_tiled.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/back_widget.dart';
import '../../data/models/shipping_and_payment_model.dart';

class CartShippingAndPaymentItem extends StatelessWidget {
  const CartShippingAndPaymentItem(
      {super.key, required this.shippingAndPaymentModel});
  final ShippingAndPaymentModel shippingAndPaymentModel;

  @override
  Widget build(BuildContext context) {
    return BackgroundListTile(
        height: 80,
        child: Center(
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(shippingAndPaymentModel.title,
                    style: Styles.styleMediumWithOpacity12(context))),
            subtitle: Text(shippingAndPaymentModel.subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Styles.styleMedium16(context)),
            trailing: BackWidget(
                backWidgetModel:
                    BackWidgetModel(onTap: shippingAndPaymentModel.onTap)),
          ),
        ));
  }
}
