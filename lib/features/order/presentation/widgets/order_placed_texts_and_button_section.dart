import 'package:e_clot_shop/core/models/custom_button_model.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class OrderPlacedTextsAndButtonSection extends StatelessWidget {
  const OrderPlacedTextsAndButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Text('Order Placed\n Successfully',
            textAlign: TextAlign.center, style: Styles.styleBoldGarabito32),
        const SizedBox(height: 32),
        Text('Your order has been placed\n successfully',
            textAlign: TextAlign.center,
            style: Styles.styleMedium16WithOpacity),
        const Spacer(),
        CustomButton(
            customButtonModel:
                CustomButtonModel(buttonName: 'See Order details')),
        const Spacer(),
      ],
    );
  }
}
