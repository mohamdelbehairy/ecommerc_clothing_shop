import 'package:e_clot_shop/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/custom_button_model.dart';
import '../../../../core/widgets/function/custom_snack_bar_widget.dart';
import '../../../payment/presentation/manager/strip/strip_payment_cubit.dart';
import 'function/place_order_button_on_tap.dart';

class CartProductButtonPlaceOrder extends StatelessWidget {
  const CartProductButtonPlaceOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripPaymentCubit, StripPaymentState>(
      listener: (context, state) {
        if (state is StripPaymentSuccess) {}
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
                  await placeOrderButtonOnTap(context);
                },
                buttonName: 'Place Order'));
      },
    );
  }
}
