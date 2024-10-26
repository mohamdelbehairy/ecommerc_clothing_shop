import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'order_view_body_details.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 63),
          Center(child: Text('Orders', style: Styles.styleBold16)),
          const SizedBox(height: 24),
          const OrderViewBodyDetails()
        ],
      ),
    );
  }
}

