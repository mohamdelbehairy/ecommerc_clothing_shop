import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/build_order/build_order_cubit.dart';
import '../widgets/order_view_body.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key, this.isSetting = false});
  final bool isSetting;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BuildOrderCubit(),
      child: Scaffold(
        body: OrderViewBody(isSetting: isSetting),
      ),
    );
  }
}
