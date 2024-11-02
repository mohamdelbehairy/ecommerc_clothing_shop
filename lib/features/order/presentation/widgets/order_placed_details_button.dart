import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../core/models/custom_button_model.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/widgets/custom_button.dart';
import '../manager/order/order_cubit.dart';
import 'function/save_order_method.dart';

class OrderPlacedDetailsButton extends StatelessWidget {
  const OrderPlacedDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state is SaveOrderSuccess) {
          GoRouter.of(context).go(AppRouter.bottomNavigationBar);
          context.read<BuildAppCubit>().resetOrder();
        }
      },
      builder: (context, state) {
        return CustomButton(
            customButtonModel: CustomButtonModel(
                isLoading: context.read<OrderCubit>().isLoading,
                onTap: () async {
                  await saveOrderMethod(context);
                },
                buttonName: 'Go to Home'));
      },
    );
  }
}

