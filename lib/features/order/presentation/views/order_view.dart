import 'package:flutter/material.dart';

import '../widgets/order_view_body.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key, this.isSetting = false});
  final bool isSetting;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrderViewBody(isSetting: isSetting),
    );
  }
}
