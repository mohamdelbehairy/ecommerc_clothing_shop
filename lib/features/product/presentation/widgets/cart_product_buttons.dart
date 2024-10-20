import 'package:e_clot_shop/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/custom_button_model.dart';
import 'cart_coupon_code_widget.dart';

class CartProductButtons extends StatelessWidget {
  const CartProductButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CartCouponCodeWidget(),
        const SizedBox(height: 64),
        CustomButton(
            customButtonModel: CustomButtonModel(buttonName: 'Checkout'))
      ],
    );
  }
}


