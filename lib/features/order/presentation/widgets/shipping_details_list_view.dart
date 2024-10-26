import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';
import '../../../../core/models/background_model.dart';
import '../../../../core/widgets/custom_background_container.dart';

class ShippingDetailsListTile extends StatelessWidget {
  const ShippingDetailsListTile({super.key, required this.shippingAddress});
  final String shippingAddress;

  @override
  Widget build(BuildContext context) {
    
    return CustomBakgroundContainer(
      backgroundModel: BackgroundModel(
        height: 64,
        borderRadiusDouble: 8,
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Spacer(),
          Text(shippingAddress, 
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Styles.styleMedium14),
          const SizedBox(height: 4),
          Text('121-224-7890', style: Styles.styleMedium14),
          const Spacer(),
        ]),
      ),
    );
  }
}
