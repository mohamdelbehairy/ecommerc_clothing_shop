import 'package:flutter/material.dart';

import '../widgets/order_placed_details_view_body.dart';

class OrderPlacedDetailsView extends StatelessWidget {
  const OrderPlacedDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OrderPlacedDetailsViewBody(),
    );
  }
}
