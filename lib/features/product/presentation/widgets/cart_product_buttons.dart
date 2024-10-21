import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/widgets/custom_button.dart';
import 'package:e_clot_shop/core/widgets/function/custom_snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../core/models/custom_button_model.dart';
import 'cart_coupon_code_widget.dart';

class CartProductButtons extends StatelessWidget {
  const CartProductButtons({super.key});

  @override
  Widget build(BuildContext context) {
    var buildAppCubit = context.read<BuildAppCubit>();
    return Column(
      children: [
        const CartCouponCodeWidget(),
        const SizedBox(height: 64),
        CustomButton(
            customButtonModel: CustomButtonModel(
                onTap: () {
                  if (buildAppCubit.isEmptyDetails().isNotEmpty) {
                    customSnackbarWidget(context,
                        margin: const EdgeInsets.symmetric(
                            vertical: 70, horizontal: 32),
                        color: AppColors.primaryColor,
                        message: buildAppCubit.isEmptyDetails());
                  } else {}
                },
                buttonName: 'Checkout'))
      ],
    );
  }
}
