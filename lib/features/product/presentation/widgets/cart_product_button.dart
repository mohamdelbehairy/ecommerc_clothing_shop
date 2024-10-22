import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/widgets/custom_button.dart';
import 'package:e_clot_shop/core/widgets/function/custom_snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../core/models/custom_button_model.dart';

class CartProductButton extends StatelessWidget {
  const CartProductButton({super.key});

  @override
  Widget build(BuildContext context) {
    var buildAppCubit = context.read<BuildAppCubit>();

    return CustomButton(
        customButtonModel: CustomButtonModel(
            onTap: () {
              if (buildAppCubit.isEmptyDetails().isNotEmpty) {
                customSnackbarWidget(context,
                    margin: const EdgeInsets.symmetric(
                        vertical: 70, horizontal: 60),
                    color: AppColors.primaryColor,
                    message: buildAppCubit.isEmptyDetails());
              } else {}
            },
            buttonName: 'Place Order'));
  }
}
