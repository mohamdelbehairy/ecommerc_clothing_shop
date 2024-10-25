import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../widgets/order_placed_success_view_body.dart';

class OrderPlacedSuccessView extends StatelessWidget {
  const OrderPlacedSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: OrderPlacedSuccessViewBody(),
    );
  }
}
