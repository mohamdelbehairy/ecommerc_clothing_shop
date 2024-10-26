import 'dart:math';

import 'package:e_clot_shop/features/order/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../core/models/custom_button_model.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/widgets/custom_button.dart';
import '../manager/order/order_cubit.dart';

class OrderPlacedDetailsButton extends StatelessWidget {
  const OrderPlacedDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    var buildAppCubit = context.read<BuildAppCubit>();
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state is SaveOrderSuccess) {
          GoRouter.of(context).go(AppRouter.bottomNavigationBar);
          buildAppCubit.resetOrder();
        }
      },
      builder: (context, state) {
        return CustomButton(
            customButtonModel: CustomButtonModel(
                isLoading: state is OrderLoading,
                onTap: () async {
                  await context.read<OrderCubit>().saveOrder(
                      orderModel: OrderModel(
                          orderID: generateUniqueId(),
                          quantity: buildAppCubit.quantity.toString(),
                          color: buildAppCubit.color,
                          size: buildAppCubit.size,
                          shippingAddress: buildAppCubit.shippingAddress,
                          productModel: buildAppCubit.productData!));
                },
                buttonName: 'Go to Home'));
      },
    );
  }
}

String generateUniqueId() {
  Random random = Random();
  return (100000 + random.nextInt(900000)).toString();
}
