import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../app/presentation/manager/build_app/build_app_cubit.dart';
import '../../../../core/models/custom_button_model.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/widgets/custom_button.dart';
import '../manager/build_order/build_order_cubit.dart';
import 'function/store_order_method.dart';

class OrderPlacedDetailsButton extends StatelessWidget {
  const OrderPlacedDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BuildOrderCubit, BuildOrderState>(
      listener: (context, state) {
        if (state is StoreOrderSuccess) {
          GoRouter.of(context).go(AppRouter.bottomNavigationBar);
          context.read<BuildAppCubit>().resetOrder();
        }
      },
      builder: (context, state) {
        return CustomButton(
            customButtonModel: CustomButtonModel(
                isLoading: context.read<BuildOrderCubit>().isLoading,
                onTap: () async {
                  await storeOrderMethod(context);
                },
                buttonName: 'Go to Home'));
      },
    );
  }
}
