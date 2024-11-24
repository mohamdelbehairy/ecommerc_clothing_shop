import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/core/widgets/background_list_tile.dart';
import 'package:flutter/material.dart';

class ShippingDetailsListTile extends StatelessWidget {
  const ShippingDetailsListTile(
      {super.key, required this.shippingAddress, required this.shippingCost});
  final String shippingAddress, shippingCost;

  @override
  Widget build(BuildContext context) {
    return BackgroundListTile(
        height: 64,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Spacer(),
          Text(shippingAddress,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Styles.styleMedium14(context)),
          const SizedBox(height: 4),
          Text('\$$shippingCost', style: Styles.styleMedium14(context)),
          const Spacer(),
        ]));
  }
}
