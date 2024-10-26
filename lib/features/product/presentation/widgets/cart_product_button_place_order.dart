import 'package:e_clot_shop/core/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:e_clot_shop/core/widgets/custom_button.dart';
import 'package:e_clot_shop/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/custom_button_model.dart';
import '../../../../core/widgets/function/custom_snack_bar_widget.dart';
import '../../../payment/presentation/manager/strip/strip_payment_cubit.dart';
import 'function/place_order_button_on_tap.dart';

class CartProductButtonPlaceOrder extends StatelessWidget {
  const CartProductButtonPlaceOrder({super.key, required this.productData});
  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripPaymentCubit, StripPaymentState>(
      listener: (context, state) {
        if (state is StripPaymentSuccess) {
          context.read<BuildAppCubit>().productData = productData;
          GoRouter.of(context).go(AppRouter.orderPlacedSuccess);
        }
        if (state is StripPaymentFailure) {
          customSnackbarWidget(context,
              margin: const EdgeInsets.symmetric(vertical: 70, horizontal: 100),
              message: 'Payment has been cancelled');
        }
      },
      builder: (context, state) {
        return CustomButton(
            customButtonModel: CustomButtonModel(
                isLoading: state is StripPaymentLoading,
                onTap: () async {
                  await placeOrderButtonOnTap(context,
                      productData: productData);
                },
                buttonName: 'Place Order'));
      },
    );
  }
}
