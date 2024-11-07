import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/back_and_text_header.dart';
import 'order_view_body_details.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key, required this.isSetting});
  final bool isSetting;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 63),
        if (isSetting) const Padding(
           padding: EdgeInsets.symmetric(horizontal: 24),
          child: BackAndTextHeader(text: 'Orders')),
        if (!isSetting)
          Center(child: Text('Orders', style: Styles.styleBold16(context))),
        const SizedBox(height: 24),
        const OrderViewBodyDetails()
      ],
    );
  }
}
